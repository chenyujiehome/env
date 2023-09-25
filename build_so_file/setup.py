from setuptools import setup, Extension

module = Extension('example', sources = ['example.c'])

setup(name = 'Example',
      version = '1.0',
      description = 'This is a demo package',
      ext_modules = [module])