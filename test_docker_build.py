import sys
import vtk
import numpy.version
import scipy
import PIL


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print("Python Version: ", sys.version)
    print("PIL version: ", PIL.__version__)
    print("NumPy Version: ", numpy.version.version)
    print("SciPy Version: ", scipy.__version__)
    print(vtk.vtkVersion.GetVTKSourceVersion())
