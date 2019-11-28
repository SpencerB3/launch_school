// Refactor this statement to use an if statement instead.

return foo() ? 'bar' : qux();

if (foo()) {
  return 'bar';
} else {
  return qux();
}
