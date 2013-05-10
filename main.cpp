//---------------------------------------------------------------
//  A QT Interface fot CUDA-based Code
//
//  Author  :   Xining Du
//  Email   :   xiningdu@gmail.com
//---------------------------------------------------------------

#include <QtCore/QCoreApplication>
#include <QApplication>
#include <QWidget>

#include <iostream>
#include <cmath>


#define N 100

using namespace std;



extern "C" void runCudaPart(float a[], float b[], float c[], int n);

int main(int argc, char* argv[])
{
    QCoreApplication app(argc, argv);
    //QApplication a(argc, argv);
    //QWidget window;
    //window.resize(200,100);
    //window.show();
    
    //float a[N], b[N], c[N];
    float *a, *b, *c;
    a = (float*)malloc(N*sizeof(float));
    b = (float*)malloc(N*sizeof(float));
    c = (float*)malloc(N*sizeof(float));

    for(int i=0; i<N; i++)
    {
        a[i] = sin((float)i*i);
        b[i] = cos((float)i*i);
        c[i] = 0;
    }

    runCudaPart(a, b, c, N);
    //cout << "Hello world!" << endl;
    
    for(int i=0; i<N; i++)
    {
        cout << a[i] << " + " << b[i] << " = " << "c[" << i << "] = " << c[i] << endl;
    }
    
    return app.exec();
}
