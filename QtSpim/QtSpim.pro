#  SPIM S20 MIPS simulator.
#  Qt interface for SPIM simulator.
#
#  Copyright (c) 1990-2020, James R. Larus.
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without modification,
#  are permitted provided that the following conditions are met:
#
#  Redistributions of source code must retain the above copyright notice,
#  this list of conditions and the following disclaimer.
#
#  Redistributions in binary form must reproduce the above copyright notice,
#  this list of conditions and the following disclaimer in the documentation and/or
#  other materials provided with the distribution.
#
#  Neither the name of the James R. Larus nor the names of its contributors may be
#  used to endorse or promote products derived from this software without specific
#  prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
#  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
#  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
#  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
#  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
#  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
#  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
#  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

#-------------------------------------------------
#
# Project created by QtCreator 2010-07-11T10:46:07
#
#-------------------------------------------------

cache()

QT       += core widgets printsupport

TARGET = QtSpim
TEMPLATE = app


YACCSOURCES = ../CPU/parser.y
LEXSOURCES  = ../CPU/scanner.l

SOURCES += main.cpp\
        spimview.cpp\
        menu.cpp\
        regwin.cpp\
        textwin.cpp\
        datawin.cpp\
        state.cpp\
        console.cpp\
        ../CPU/data.cpp\
        ../CPU/display-utils.cpp\
        ../CPU/inst.cpp\
        ../CPU/mem.cpp\
        ../CPU/run.cpp\
        ../CPU/spim-utils.cpp\
        ../CPU/string-stream.cpp\
        ../CPU/sym-tbl.cpp\
        ../CPU/syscall.cpp\
        spim_support.cpp


HEADERS  += spimview.h\
        regtextedit.h\
        texttextedit.h\
        datatextedit.h\
        spim_settings.h\
        settablecheckbox.h\
        console.h


FORMS    += spimview.ui\
        savelogfile.ui\
        printwindows.ui\
        runparams.ui\
        settings.ui\
        changevalue.ui \
        breakpoint.ui


INCLUDEPATH = ../CPU ../QtSpim


RESOURCES = windows_images.qrc exception.qrc

win32:RC_FILE = qtspim.rc


QMAKE_YACC          = bison
QMAKE_YACCFLAGS     = -d --defines=parser.tab.h --output=parser.tab.cpp
QMAKE_YACCFLAGS_MANGLE = -p yy
QMAKE_YACC_HEADER   = parser.tab.h
QMAKE_YACC_SOURCE   = parser.tab.cpp

QMAKE_LEX           = flex
QMAKE_LEXFLAGS_MANGLE = -Pyy
QMAKE_LEXFLAGS      = -I -8 --outfile=lex.scanner.c


# Help file
#
HELP_PROJ           = help/qtspim.qhp
buildcompressedhelp.name    = Build compressed help
buildcompressedhelp.input   = HELP_PROJ
buildcompressedhelp.output  = help/${QMAKE_FILE_BASE}.qch
buildcompressedhelp.commands= qhelpgenerator ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
buildcompressedhelp.CONFIG  = no_link recursive

# qcollectiongenerator must be run in the directory containing the project file, otherwise it
# puts partial paths in the .qhc file, which make it impossible to install the help files in
# other directories.
#
HELP_COL_PROJ       = help/qtspim.qhcp
buildhelpcollection.name    = Build help collection
buildhelpcollection.input   = HELP_COL_PROJ
buildhelpcollection.output  = help/${QMAKE_FILE_BASE}.qhc
linux|macx:buildhelpcollection.commands= bash -c '\"pushd ${QMAKE_FILE_PATH}; qcollectiongenerator ${QMAKE_FILE_BASE}.qhcp; popd; $(COPY) ${QMAKE_FILE_PATH}/${QMAKE_FILE_BASE}.qhc ${QMAKE_FILE_OUT};\"'
win32:buildhelpcollection.commands= cmd -c '\"pushd ${QMAKE_FILE_PATH} & qcollectiongenerator ${QMAKE_FILE_BASE}.qhcp & popd & $(COPY) ${QMAKE_FILE_PATH}\\${QMAKE_FILE_BASE}.qhc ${QMAKE_FILE_OUT}\"'
buildhelpcollection.CONFIG  = no_link recursive

QMAKE_EXTRA_COMPILERS       += buildcompressedhelp buildhelpcollection
POST_TARGETDEPS             += help/qtspim.qch help/qtspim.qhc


# Microsoft Visual C compiler flags
#
win32-msvc2008 {
  # Compile all files as C++
  #
  QMAKE_CFLAGS_DEBUG    += -TP
  QMAKE_CFLAGS_RELEASE  += -TP

  # Disable security warnings
  #
  DEFINES += _CRT_SECURE_NO_WARNINGS
}
win32-msvc2010 {
  # Compile all files as C++
  #
  QMAKE_CFLAGS_DEBUG    += -TP
  QMAKE_CFLAGS_RELEASE  += -TP

  # Disable security warnings
  #
  DEFINES += _CRT_SECURE_NO_WARNINGS
}
win32-msvc2012 {
  # Compile all files as C++
  #
  QMAKE_CFLAGS_DEBUG    += -TP
  QMAKE_CFLAGS_RELEASE  += -TP

  # Disable security warnings
  #
  DEFINES += _CRT_SECURE_NO_WARNINGS
}


# gcc flags
#
win32-g++ {
  # Compile all files as C++
  # Surpress gcc warning about deprecated conversion from string constant to char*
  #
  QMAKE_CFLAGS_DEBUG    += -Wno-write-strings
  QMAKE_CFLAGS_RELEASE  += -Wno-write-strings
  QMAKE_CXXFLAGS_DEBUG  += -Wno-write-strings
  QMAKE_CXXFLAGS_RELEASE += -Wno-write-strings

  # Surpress error when deleting non-existent file.
  #
  QMAKE_DEL_FILE = rm -f
  QMAKE_MOVE = mv
  QMAKE_COPY = cp
}

linux-g++-32 {
  # Compile all files as C++
  # Surpress gcc warning about deprecated conversion from string constant to char*
  #
  QMAKE_CFLAGS_DEBUG    += -Wno-write-strings
  QMAKE_CFLAGS_RELEASE  += -Wno-write-strings
  QMAKE_CXXFLAGS_DEBUG  += -Wno-write-strings
  QMAKE_CXXFLAGS_RELEASE += -Wno-write-strings

  # Libraries will be installed in standard location
  QMAKE_RPATHDIR = /usr/lib/qtspim/lib

  # Surpress error when deleting non-existent file.
  #
  QMAKE_DEL_FILE = rm -f
}

linux-g++ {
  QMAKE_CFLAGS_DEBUG   += -Wno-write-strings
  QMAKE_CFLAGS_RELEASE += -Wno-write-strings
  QMAKE_CXXFLAGS_DEBUG += -Wno-write-strings
  QMAKE_CXXFLAGS_RELEASE += -Wno-write-strings

  # Libraries will be installed in standard location
  QMAKE_RPATHDIR = /usr/lib/qtspim/lib

  # Surpress error when deleting non-existent file.
  #
  QMAKE_DEL_FILE = rm -f

  # Do not add -lGL, since this requires installation of OpenCL libraries,
  # which are already installed with QtCreator.
  QMAKE_LIBS_OPENGL = 
}

macx-g++ {
  # Compile all files as C++
  # Surpress gcc warning about deprecated conversion from string constant to char*
  #
  QMAKE_CFLAGS_DEBUG    += -Wno-write-strings -Wno-deprecated-register
  QMAKE_CFLAGS_RELEASE  += -Wno-write-strings -Wno-deprecated-register
  QMAKE_CXXFLAGS_DEBUG  += -Wno-write-strings -Wno-deprecated-register
  QMAKE_CXXFLAGS_RELEASE += -Wno-write-strings -Wno-deprecated-register

  # Surpress error when deleting non-existent file.
  #
  QMAKE_DEL_FILE = rm -f
  QMAKE_INFO_PLIST = macinfo.plist

  ICON = NewIcon.icns
}

macx-clang {
  # Compile all files as C++
  # Surpress gcc warning about deprecated conversion from string constant to char*
  #
  QMAKE_CFLAGS_DEBUG    += -Wno-write-strings -Wno-deprecated-register
  QMAKE_CFLAGS_RELEASE  += -Wno-write-strings -Wno-deprecated-register
  QMAKE_CXXFLAGS_DEBUG  += -Wno-write-strings -Wno-deprecated-register
  QMAKE_CXXFLAGS_RELEASE += -Wno-write-strings -Wno-deprecated-register

  # Surpress error when deleting non-existent file.
  #
  QMAKE_DEL_FILE = rm -f
  QMAKE_INFO_PLIST = macinfo.plist

  ICON = NewIcon.icns
}
