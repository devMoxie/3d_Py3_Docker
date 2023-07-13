# Python 3.11.3 + VTK 9.1.2

The purpose of this project is to create a Docker image with the below requirements to which a source code 
directory can be bind-mounted.

* Python 3.11.3
* VTK 9.1.2 built from source [https://www.vtk.org/files/release/9.2/VTK-9.2.6.tar.gz](https://www.vtk.org/files/release/9.2/VTK-9.2.6.tar.gz)
* See requirements.txt for additional python packages installed.

## Pulling and Running the Image

* In Docker Desktop, in the search bar at the top, search: `devmoxie/py3.vtk9.1.2:v1.0` and pull the image
* Confirm that you see the image listed on “Images” side tab
* Test the image in your shell/terminal: `docker run --rm devmoxie/py3.vtk9.1.2:v1.0 `
* The following should be printed:

````
Python Version:  3.11.3
PIL version:  9.5.0
NumPy Version:  1.24.3
SciPy Version:  1.10.1
vtk version 9.2.6`