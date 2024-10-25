/**
 * @description Find all functions longer than 10 lines
 * @kind problem
 * @id javascript/find-all-tests
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if the given function is a public method of a class.
 */
predicate isPublicMethod(Function f) {
  exists(MethodDefinition md | md.isPublic() and md.getBody() = f)
}

/**
* Holds if the given function is exported from a module.
*/
predicate isExportedFunction(Function f) {
  exists(Module m | m.getAnExportedValue(_).getAFunctionValue().getFunction() = f) and
  not f.inExternsFile()
}

/**
 * Holds if a function is longer than 10 lines.
 */
predicate longerThanTenLines(Function func) {
  func.getNumLines() > 10
}

from Function function
where isPublicMethod(function) and isExportedFunction(function) and
 longerThanTenLines(function)
select function, "is longer than 10 lines"