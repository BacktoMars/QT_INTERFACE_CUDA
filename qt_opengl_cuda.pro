######################################################################
# Automatically generated by qmake (2.01a) Thu May 9 21:33:32 2013
######################################################################

TEMPLATE = app
TARGET = qt_opengl_cuda
DEPENDPATH += .
INCLUDEPATH += .

# Input
SOURCES += main.cpp mainwindow.cpp appglwidget.cpp \
    mainform.cpp simplePBO.cpp

HEADERS += mainwindow.h \
    appglwidget.h \
    mainform.h \
    simplePBO.h
# Console application
#CONFIG += console


QT+= opengl

# cuda source
CUDA_SOURCES += kernel.cu
# Path to cuda toolkit install
CUDA_DIR = /usr/local/cuda
INCLUDEPATH += $$CUDA_DIR/include
QMAKE_LIBDIR += $$CUDA_DIR/lib64
# GPU architecture
CUDA_ARCH = sm_35
# NVCC flags
#NVCCFLAGS = --compiler-options -fno-strict-aliasing -use_fast_math --ptxas-options=-v
NVCCFLAGS = --compiler-options -use_fast_math
# Path to libraries
LIBS += -lcudart -lcuda
# join the includes in a line
CUDA_INC = $$join(INCLUDEPATH,' -I','-I',' ')
cuda.commands = $$CUDA_DIR/bin/nvcc -m64 -O3 -arch=$$CUDA_ARCH -c $$NVCCFLAGS $$CUDA_INC $$LIBS ${QMAKE_FILE_NAME} -o ${QMAKE_FILE_OUT}
cuda.dependcy_type = TYPE_C
cuda.depend_command = $$CUDA_DIR/bin/nvcc -O3 -M $$CUDA_INC $$NVCCFLAGS      ${QMAKE_FILE_NAME}

cuda.input = CUDA_SOURCES
cuda.output = ${OBJECTS_DIR}${QMAKE_FILE_BASE}_cuda.o
# Tell Qt that we want add more stuff to the Makefile
QMAKE_EXTRA_COMPILERS += cuda

FORMS += \
    mainform.ui
