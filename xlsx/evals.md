# Evals — XLSX Toolkit
> Pass/fail checks for spreadsheet quality.

## Formula Correctness
- [ ] Zero formula errors after recalculation (#REF!, #DIV/0!, #VALUE!, #N/A, #NAME? all absent)
- [ ] Formulas use Excel functions (not hardcoded Python-calculated values)
- [ ] Assumptions are placed in separate cells, referenced by formula (not inline constants)
- [ ] Cross-sheet references use correct format (Sheet1!A1)

## Financial Model Standards (when applicable)
- [ ] Color coding: blue text = inputs, black = formulas, green = cross-sheet links
- [ ] Number formatting: currency uses $#,##0, percentages use 0.0%, negatives use parentheses
- [ ] Years formatted as text strings ("2024" not 2,024)
- [ ] Zeros display as "-" in financial models

## Output Quality
- [ ] File opens without errors in Excel / LibreOffice / Google Sheets
- [ ] Column widths are appropriate for content (no ###### visible)
- [ ] recalc.py is run after any formula modification (mandatory step)
- [ ] Existing template formatting is preserved when editing (not overridden)

## Edge Cases
- [ ] NaN/null values handled correctly in formulas
- [ ] Large files use read_only/write_only mode for performance
- [ ] data_only=True is NOT used when saving (would permanently destroy formulas)

---
Score: X/Y passed
