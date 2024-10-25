/**
 * @description Find all functions longer than 10 lines
 * @kind problem
 * @id javascript/find-all-tests
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is longer than 10 lines.
 */
predicate longerThanTenLines(Function func) {
  func.getNumLines() > 10
}

from Function function
where longerThanTenLines(function)
select function, "is longer than 10 lines"