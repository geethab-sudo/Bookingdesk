#!/usr/bin/env node
/**
 * Spec Kit — minimal implementation for SDD traceability.
 * Validates that a spec file contains expected EARS/sections (spec.md).
 * Traceability: spec.md (EARS-01, EARS-02) → plan.md §4 → tasks.md T007 → this file.
 */

const fs = require('fs');
const path = require('path');

const SPEC_PATH = process.argv[2] || path.join(__dirname, '..', 'spec.md');

function validateSpec(filePath) {
  if (!fs.existsSync(filePath)) {
    console.error('ERROR: spec file not found:', filePath);
    process.exit(1);
  }
  const content = fs.readFileSync(filePath, 'utf8');
  const required = [
    'EARS',
    'User Stories',
    'Event',
    'Action',
    'Result',
    'State',
  ];
  const missing = required.filter((s) => !content.includes(s));
  if (missing.length > 0) {
    console.error('ERROR: spec missing expected content:', missing.join(', '));
    process.exit(1);
  }
  console.log('OK: spec structure validated');
}

validateSpec(SPEC_PATH);
