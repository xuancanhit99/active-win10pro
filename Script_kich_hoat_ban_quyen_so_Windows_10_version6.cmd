CHCP 1258 >nul 2>&1
CHCP 65001 >nul 2>&1
@echo off
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0""", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
color f0
title Script Kích Hoạt Bản Quyền Số Windows 10 Vĩnh Viễn
setlocal enabledelayedexpansion
setlocal EnableExtensions
pushd "%~dp0"
cd /d "%~dp0"
::===========================================================
:MAINMENU
cls
FOR /F "TOKENS=2 DELIMS==" %%A IN ('"WMIC PATH SoftwareLicensingProduct WHERE (Name LIKE 'Windows%%' AND PartialProductKey is not NULL) GET LicenseFamily /VALUE"') DO IF NOT ERRORLEVEL 1 SET "osedition=%%A"
IF NOT DEFINED osedition (
cls
FOR /F "TOKENS=3 DELIMS=: " %%A IN ('DISM /English /Online /Get-CurrentEdition 2^>nul ^| FIND /I "Current Edition :"') DO SET "osedition=%%A"
echo        ====================================================================================================
echo               Không tìm thấy khóa sản phẩm, Có thể việc phát hiện Phiên bản Windows không chính xác,
echo                                Hãy sử dụng lựa chọn "[5] Thay đổi Phiên bản Windows 10".
echo        ====================================================================================================
echo.
pause
)
for /f "tokens=2 delims==" %%a IN ('"wmic Path Win32_OperatingSystem Get Version /format:LIST"')do (set Version=%%a) >nul 2>&1
cls
echo.                              _________________________________________________________
echo.
echo                                 Windows 10 %osedition% %Version%                      
echo.                              _________________________________________________________
echo.                             ^|                                                         ^|
Echo.                             ^|   [1] Kích hoạt bản quyền số Windows 10 VĨNH VIỄN.      ^|
Echo.                             ^|                                                         ^|
Echo.                             ^|   [2] Kiểm tra trạng thái kích hoạt của Windows.        ^|  
Echo.                             ^|                                                         ^|
Echo.                             ^|   [3] _Thông tin về Script Kích hoạt_                   ^|
Echo.                             ^|                                                         ^|    
echo.                             ^|                  + Tùy Chọn Nâng Cao +                  ^|
echo.                             ^|                                                         ^|
Echo.                             ^|   [4] Chèn Key mặc định.                                ^|
Echo.                             ^|                                                         ^|
Echo.                             ^|   [5] Thay đổi Phiên bản Windows 10.                    ^|
Echo.                             ^|                                                         ^|
Echo.                             ^|   [6] Trích xuất Thư mục $OEM$ ra Desktop.              ^|
Echo.                             ^|                   _______________                       ^|
echo.                             ^|                                                         ^|  
Echo.                             ^|   [7] Kiểm tra Cập nhật Script.                         ^|
Echo.                             ^|                                                         ^|
Echo.                             ^|   [8] Thoát.                                            ^|
Echo.                             ^|_________________________________________________________^|
ECHO.
choice /C:12345678 /N /M ".                             Nhập lựa chọn của bạn [1,2,3,4,5,6,7,8] : "
if errorlevel 8 goto:Exit
if errorlevel 7 goto:CheckForUpdates
if errorlevel 6 goto:Extract
if errorlevel 5 goto:EditionChange
if errorlevel 4 goto:InsertProductKey
if errorlevel 3 goto:ReadMe
if errorlevel 2 goto:Check
if errorlevel 1 goto:HWIDActivate
::===========================================================
:key
rem              Edition                          Key              SKU EditionId
(
echo Cloud                          V3WVW-N2PV2-CGWC3-34QGF-VMJ2C 178 X21-32983
echo CloudN                         NH9J3-68WK7-6FB93-4K3DF-DJ4F6 179 X21-32987
echo Core                           YTMG3-N6DKC-DKB77-7M9GH-8HVX7 101 X19-98868
echo CoreCountrySpecific            N2434-X9D7W-8PF6X-8DV9T-8TYMD  99 X19-99652
echo CoreN                          4CPRK-NM3K3-X6XXQ-RXX86-WXCHW  98 X19-98877
echo CoreSingleLanguage             BT79Q-G7N6G-PGBYW-4YWX6-6F4BT 100 X19-99661
echo Education                      YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY 121 X19-98886
echo EducationN                     84NGF-MHBT6-FXBX8-QWJK7-DRR8H 122 X19-98892
echo Enterprise                     XGVPP-NMH47-7TTHJ-W3FW7-8HV2C   4 X19-99683
echo EnterpriseN                    3V6Q6-NQXCX-V8YXR-9QCYV-QPFCT  27 X19-98746
echo EnterpriseS                    NK96Y-D9CD8-W44CQ-R8YTK-DYJWX 125 X21-05035
echo EnterpriseSN                   2DBW3-N2PJG-MVHW3-G7TDK-9HKR4 126 X21-04921
echo Professional                   VK7JG-NPHTM-C97JM-9MPGT-3V66T  48 X19-98841
echo ProfessionalEducation          8PTT6-RNW4C-6V7J2-C2D3X-MHBPB 164 X21-04955
echo ProfessionalEducationN         GJTYN-HDMQY-FRR76-HVGC7-QPF8P 165 X21-04956
echo ProfessionalN                  2B87N-8KFHP-DKV6R-Y2C8J-PKCKT  49 X19-98859
echo ProfessionalWorkstation        DXG7C-N36C4-C4HTG-X4T3X-2YV77 161 X21-43626
echo ProfessionalWorkstationN       WYPNQ-8C467-V2W6J-TX4WX-WT2RQ 162 X21-43644
echo ServerRdsh                     NJCF7-PW8QT-3324D-688JX-2YV66 175 X21-41295
echo EnterpriseG                    FV469-WGNG4-YQP66-2B2HY-KD8YX 171 X21-24727
echo EnterpriseGN                   FW7NV-4T673-HF4VX-9X4MM-B4H4T 172 X21-24709
echo ProfessionalCountrySpecific    HNGCC-Y38KG-QVK8D-WMWRK-X86VK 139 X99-99999
echo ProfessionalSingleLanguage     G3KNM-CHG6T-R36X3-9QDG6-8M8K9 138 X99-99999
echo 
) > "%temp%\editions"
goto:eof
::===========================================================
:HWIDActivate
CLS
wmic path SoftwareLicensingProduct where (LicenseStatus='1' and GracePeriodRemaining='0' and PartialProductKey is not NULL) get Name 2>nul | findstr /i "Windows" 1>nul && (
echo.
echo ==================================================================
echo Đang kiểm tra: Windows 10 %osedition% được kích hoạt VĨNH VIỄN.
echo Bạn không cần phải Kích hoạt lại.
echo ==================================================================
echo.
echo Nhấn phím bất kỳ để tiếp tục...
pause >nul
goto:MainMenu
)
::===========================================================
cls
echo Kích hoạt Bản quyền Kỹ thuật số Windows 10 %osedition%
call:key
for /f "tokens=1-4 usebackq" %%a in ("%temp%\editions") do (if ^[%%a^]==^[%osedition%^] (
    set edition=%%a
    set key=%%b
    set sku=%%c
    set editionId=%%d
    goto:parseAndPatch))
echo:
echo Script kích hoạt giấy phép kỹ thuật số không hỗ trợ %osedition%
echo:
echo Nhấn phím bất kỳ để tiếp tục...
del /f "%temp%\editions"
pause >nul
goto:MainMenu
::===========================================================
:parseAndPatch
cls
echo              =================================================================================================
echo                                   Kích hoạt Bản quyền Kỹ thuật số Windows 10 %osedition%
echo                  +++ Lưu ý - Để kích hoạt thành công, Dịch vụ Windows Update và Internet phải được BẬT +++
echo              =================================================================================================
echo.
echo Đang cài đặt khóa sản phẩm mặc định cho Windows 10 %osedition% ...
cscript /nologo %windir%\system32\slmgr.vbs -ipk %key%
wmic path SoftwareLicensingProduct where (LicenseStatus='1' and GracePeriodRemaining='0' and PartialProductKey is not NULL) get Name 2>nul | findstr /i "Windows" 1>nul && (
echo.
echo ==================================================================
echo Đang kiểm tra: Windows 10 %osedition% được kích hoạt VĨNH VIỄN.
echo Bạn không cần phải Kích hoạt lại.
echo ==================================================================
echo.
echo Nhấn phím bất kỳ để tiếp tục...
del /f "%temp%\editions"
pause >nul
goto:MainMenu
)
::===========================================================
cd /d "%~dp0"
set "gatherosstate=bin\gatherosstate.exe"
echo Đang tạo các mục đăng ký...
reg add "HKLM\SYSTEM\Tokens" /v "Channel" /t REG_SZ /d "Retail" /f
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d %sku% /f
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Security-SPP-GenuineLocalStatus" /t REG_DWORD /d 1 /f
echo Tạo tệp GenuineTicket.XML cho Windows 10 %osedition% ...
start /wait "" "%gatherosstate%"
timeout /t 3 >nul 2>&1
echo Tệp GenuineTicket.XML đang được cài đặt cho Windows 10 %osedition% ...
clipup -v -o -altto bin\
echo ===================================================================================
cscript /nologo %windir%\system32\slmgr.vbs -ato
echo ===================================================================================
echo Đang xóa các mục đăng ký...
reg delete "HKLM\SYSTEM\Tokens" /f
del /f "%temp%\editions"
echo:
echo Nhấn phím bất kỳ để tiếp tục...
pause >nul
goto:MainMenu
::===========================================================
:Check
CLS
echo ======================================================================
echo.
cscript //nologo %systemroot%\System32\slmgr.vbs /dli
cscript //nologo %systemroot%\System32\slmgr.vbs /xpr
echo.
echo ======================================================================
echo.
echo Nhấn phím bất kỳ để tiếp tục...
pause >nul
goto:MainMenu
::===========================================================
:ReadMe
CLS
cd /d "%~dp0"
type _ThongTinScript_.txt
echo.
echo.
echo Nhấn phím bất kỳ để tiếp tục...
pause >nul
goto:MAINMENU
::===========================================================
:InsertProductKey
CLS
echo:
call:key
for /f "tokens=1-4 usebackq" %%a in ("%temp%\editions") do (if ^[%%a^]==^[%osedition%^] (
    set edition=%%a
    set key=%%b
    set sku=%%c
    set editionId=%%d
    goto :Insertkey))
echo Script kích hoạt giấy phép kỹ thuật số không hỗ trợ %osedition%
echo Nhấn phím bất kỳ để tiếp tục...
del /f "%temp%\editions"
pause >nul
goto:MainMenu
:Insertkey
CLS
echo:
echo =============================================================
echo Đang cài đặt khóa sản phẩm cho Windows 10 %osedition%
echo =============================================================
echo:
cscript /nologo %windir%\system32\slmgr.vbs -ipk %key%
echo:
echo Nhấn phím bất kỳ để tiếp tục...
del /f "%temp%\editions"
pause >nul
goto:MAINMENU
::===========================================================
:EditionChange
cls
echo ========================================================================================
echo Lưu ý: Script này không thể thay đổi phiên bản Home(Core) mặc định thành phiên bản khác
echo Để làm điều này, hãy Copy Key mặc định của phiên bản Pro VK7JG-NPHTM-C97JM-9MPGT-3V66T
echo      Rồi vào Setting - Updated and Secure - Activation: chèn Key vào Change Product
echo.
echo ========================================================================================
echo Bạn có thể thay đổi Phiên bản Hiện tại của mình thành một trong những Phiên bản sau:
echo ========================================================================================
echo.
for /f "tokens=4" %%a in ('dism /online /english /Get-TargetEditions ^| findstr /i /c:"Target Edition : "') do echo %%a
echo.
choice /C:QT /N /M "[T] Tiếp tục [G] Quay lại : "
        if %errorlevel%==1 Goto:MainMenu
Echo.
for /f "tokens=4" %%a in ('dism /online /english /Get-TargetEditions ^| findstr /i /c:"Target Edition : "') do (
    set osedition=%%a
    choice /C:NY /N /M "Bạn có muốn thay đổi sang phiên bản %%a không? [Y,N] : "
    if errorlevel 2 (
	call:key
        for /f "tokens=1-4 usebackq" %%a in ("%temp%\editions") do (if ^[%%a^]==^[!osedition!^] (
        set edition=%%a
        set key=%%b
		cls
		echo.
		echo.
		echo ====================================================================================================
        echo Thay đổi Key !key! cho Windows 10 phiên bản !osedition!
        cscript /nologo %windir%\system32\slmgr.vbs -ipk !key!
		echo ====================================================================================================
		echo. 
		echo Nhấn phím bất kỳ để tiếp tục...
		del /f "%temp%\editions"
        pause >nul
        goto :MainMenu))
    echo Không được hỗ trợ.
    echo Nhấn phím bất kỳ để tiếp tục...
	del /f "%temp%\editions"
    pause >nul
    goto:MainMenu))
	goto:MainMenu
::===========================================================
:Extract
cls
cd /d "%userprofile%\desktop\"
IF EXIST $OEM$ (
echo.
echo.
echo ===============================================
echo Thư mục $OEM$ đã tồn tại trên Desktop.
echo ===============================================
echo. 
echo Nhấn phím bất kỳ để tiếp tục...
pause >nul
goto:MAINMENU
) ELSE (
md $OEM$\$$\Setup\Scripts\BIN
cd /d "%~dp0"
copy BIN\gatherosstate.exe "%userprofile%\desktop\$OEM$\$$\Setup\Scripts\BIN"
copy BIN\slc.dll "%userprofile%\desktop\$OEM$\$$\Setup\Scripts\BIN"
)
cd /d "%userprofile%\desktop\$OEM$\$$\Setup\Scripts\"
(
echo @Echo off 
echo pushd "%%~dp0"
echo cd /d "%%~dp0"
echo ::===========================================================================
echo rem              Edition                          Key              SKU EditionId
echo ^(
echo echo Cloud                          V3WVW-N2PV2-CGWC3-34QGF-VMJ2C 178 X21-32983
echo echo CloudN                         NH9J3-68WK7-6FB93-4K3DF-DJ4F6 179 X21-32987
echo echo Core                           YTMG3-N6DKC-DKB77-7M9GH-8HVX7 101 X19-98868
echo echo CoreCountrySpecific            N2434-X9D7W-8PF6X-8DV9T-8TYMD  99 X19-99652
echo echo CoreN                          4CPRK-NM3K3-X6XXQ-RXX86-WXCHW  98 X19-98877
echo echo CoreSingleLanguage             BT79Q-G7N6G-PGBYW-4YWX6-6F4BT 100 X19-99661
echo echo Education                      YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY 121 X19-98886
echo echo EducationN                     84NGF-MHBT6-FXBX8-QWJK7-DRR8H 122 X19-98892
echo echo Enterprise                     XGVPP-NMH47-7TTHJ-W3FW7-8HV2C   4 X19-99683
echo echo EnterpriseN                    3V6Q6-NQXCX-V8YXR-9QCYV-QPFCT  27 X19-98746
echo echo EnterpriseS                    NK96Y-D9CD8-W44CQ-R8YTK-DYJWX 125 X21-05035
echo echo EnterpriseSN                   2DBW3-N2PJG-MVHW3-G7TDK-9HKR4 126 X21-04921
echo echo Professional                   VK7JG-NPHTM-C97JM-9MPGT-3V66T  48 X19-98841
echo echo ProfessionalEducation          8PTT6-RNW4C-6V7J2-C2D3X-MHBPB 164 X21-04955
echo echo ProfessionalEducationN         GJTYN-HDMQY-FRR76-HVGC7-QPF8P 165 X21-04956
echo echo ProfessionalN                  2B87N-8KFHP-DKV6R-Y2C8J-PKCKT  49 X19-98859
echo echo ProfessionalWorkstation        DXG7C-N36C4-C4HTG-X4T3X-2YV77 161 X21-43626
echo echo ProfessionalWorkstationN       WYPNQ-8C467-V2W6J-TX4WX-WT2RQ 162 X21-43644
echo echo ServerRdsh                     NJCF7-PW8QT-3324D-688JX-2YV66 175 X21-41295
echo ^) ^> "%%temp%%\editions"
echo ::===========================================================================
echo FOR /F "TOKENS=2 DELIMS==" %%%%A IN ^('"WMIC PATH SoftwareLicensingProduct WHERE (Name LIKE 'Windows%%%%' AND PartialProductKey is not NULL) GET LicenseFamily /VALUE"'^) DO IF NOT ERRORLEVEL 1 SET "osedition=%%%%A"
echo for /f "tokens=1-4 usebackq" %%%%a in ^("%%temp%%\editions"^) do ^(if ^^[%%%%a^^]==^^[%%osedition%%^^] ^(
echo     set edition=%%%%a
echo     set key=%%%%b
echo     set sku=%%%%c
echo     set editionId=%%%%d
echo     goto :parseAndPatch^)^)
echo echo Script kich hoat giay phep ky thuat so khong ho tro %osedition%.
echo del /f "%%temp%%\editions"
echo exit
echo ::===========================================================================
echo :parseAndPatch
echo cd /d "%%~dp0"
echo set "gatherosstate=bin\gatherosstate.exe"
echo cscript /nologo %%windir%%\system32\slmgr.vbs -ipk %%key%%
echo reg add "HKLM\SYSTEM\Tokens" /v "Channel" /t REG_SZ /d "Retail" /f
echo reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d %%sku%% /f
echo reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Security-SPP-GenuineLocalStatus" /t REG_DWORD /d 1 /f
echo start /wait "" "%%gatherosstate%%"
echo timeout /t 3 ^>nul 2^>^&1
echo clipup -v -o -altto bin\
echo cscript /nologo %%windir%%\system32\slmgr.vbs -ato
echo reg delete "HKLM\SYSTEM\Tokens" /f
echo del /f "%%temp%%\editions"
echo cd %%~dp0
echo rmdir /s /q "%%windir%%\setup\scripts" ^>nul 2^>^&1
echo exit
echo ::===========================================================================
)^> SetupComplete.cmd
cls
echo.
echo.
echo ====================================================
echo Thư mục $OEM$ được tạo thành công trên Desktop.
echo ====================================================
echo Nhấn phím bất kỳ để tiếp tục...
pause >nul
goto:MAINMENU
::===========================================================
:CheckForUpdates
start https://docs.google.com/document/d/13HZElEJtq2atBcVbF3LyZGh--W1lM5uNaIMoQZcoreU/
goto:MAINMENU
::===========================================================
:Exit
exit
::===========================================================