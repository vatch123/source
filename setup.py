from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

pyflctsubs_extension = Extension(
    name="pyflctsubs",
    sources=["pyflctsubs.pyx"],
)
setup(
    name="pyflctsubs",
    ext_modules=cythonize([pyflctsubs_extension])
)