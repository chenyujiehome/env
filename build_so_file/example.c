#include <Python.h>

static PyObject* say_hello(PyObject* self, PyObject* args) {
    const char* message;
    if (!PyArg_ParseTuple(args, "s", &message))
        return NULL;
    printf("Hello %s!\n", message);
    Py_RETURN_NONE;
}

static PyMethodDef ExampleMethods[] = {
    {"say_hello",  say_hello, METH_VARARGS, "Print a hello message."},
    {NULL, NULL, 0, NULL}
};

static struct PyModuleDef examplemodule = {
   PyModuleDef_HEAD_INIT,
   "example",   /* name of module */
   NULL,       /* module documentation, may be NULL */
   -1,         /* size of per-interpreter state of the module, or -1 if the module keeps state in global variables. */
   ExampleMethods
};

PyMODINIT_FUNC PyInit_example(void) {
    return PyModule_Create(&examplemodule);
}