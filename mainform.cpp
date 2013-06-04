#include "mainform.h"
#include "ui_mainform.h"
#include "QFile"
#include "QString"
#include "QTextStream"
#include "QFileDialog"

//#include "global.h"

float xmin = -1.5;
float xmax = 1.5;
float ymin = -1.0;
float ymax = 1.0;


MainForm::MainForm(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::MainForm)
{
    ui->setupUi(this);
    glWidget = new AppGLWidget(this);
    ui->verticalLayout->addWidget(glWidget);
}

MainForm::~MainForm()
{
    delete ui;
}

void MainForm::on_pushButton_clicked()
{
    // load file
    QString fileName = QFileDialog::getOpenFileName(this, tr("Open File"),
                                                     "",
                                                     tr("Files (*.*)"));


    //QFile inputFile(":/input.txt");
    QFile inputFile(fileName);
    inputFile.open(QIODevice::ReadOnly);

    QTextStream in(&inputFile);
    QString line = in.readAll();
    inputFile.close();

    // change the filename in the lineEdit widget
    ui->lineEdit->setText(fileName);

    ui->textEdit->setPlainText(line);
    QTextCursor cursor = ui->textEdit->textCursor();
    cursor.movePosition(QTextCursor::Start, QTextCursor::MoveAnchor, 1);

}

void MainForm::on_pushButton_RUNCUDA_clicked()
{
	//printf("Run CUDA button pushed\n");
	launch_kernel();
	printf("Kernel ended\n");
}

void MainForm::on_pushButton_ZOOM_IN_clicked()
{
	//printf("Run CUDA button pushed\n");
	//printf("Zoom button launched\n");
	xmin /= 2.0;
	xmax /= 2.0;
	ymin /= 2.0;
	ymax /= 2.0;

	glWidget->repaint();
}


void MainForm::on_pushButton_ZOOM_OUT_clicked()
{
	//printf("Run CUDA button pushed\n");
	//printf("Zoom button launched\n");
	xmin *= 2.0;
	xmax *= 2.0;
	ymin *= 2.0;
	ymax *= 2.0;

	glWidget->repaint();
}