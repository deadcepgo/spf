\ Working Set - ����� ������� ������������ ��������� ������������ ��������,
\ ����������� � ���������� ������.

REQUIRE GetCurrentProcess ~ac/lib/win/process/pipes.f
WINAPI: GetProcessMemoryInfo PSAPI.DLL
\ WINAPI: QueryWorkingSet      PSAPI.DLL
WINAPI: EmptyWorkingSet      PSAPI.DLL

0                                      \ �������� � Task Manager:
CELL -- pmc.cb
CELL -- pmc.PageFaultCount             \ ������ �������
CELL -- pmc.PeakWorkingSetSize
CELL -- pmc.WorkingSetSize             \ ������
CELL -- pmc.QuotaPeakPagedPoolUsage
CELL -- pmc.QuotaPagedPoolUsage        \ ����������� ��� ( 18�� ��� ������)
CELL -- pmc.QuotaPeakNonPagedPoolUsage
CELL -- pmc.QuotaNonPagedPoolUsage     \ ������������� ��� (������ ������ 1��)
CELL -- pmc.PagefileUsage              \ ���������� ������ (������������ ����� � �������)
CELL -- pmc.PeakPagefileUsage
CONSTANT /PROCESS_MEMORY_COUNTERS

/PROCESS_MEMORY_COUNTERS
CELL -- pmce.PrivateUsage
CONSTANT /PROCESS_MEMORY_COUNTERS_EX

: WorkingSetSize ( -- u )
  /PROCESS_MEMORY_COUNTERS_EX ALLOCATE THROW >R
  /PROCESS_MEMORY_COUNTERS R@ GetCurrentProcess GetProcessMemoryInfo ERR THROW
  R@ pmc.WorkingSetSize @
  R> FREE THROW
;
: PagefileUsage ( -- u )
  /PROCESS_MEMORY_COUNTERS_EX ALLOCATE THROW >R
  /PROCESS_MEMORY_COUNTERS R@ GetCurrentProcess GetProcessMemoryInfo ERR THROW
  R@ pmc.PagefileUsage @
  R> FREE THROW
;
\EOF

: MTEST
  WorkingSetSize . PagefileUsage . CR
  /PROCESS_MEMORY_COUNTERS_EX PAD GetCurrentProcess GetProcessMemoryInfo ERR THROW
\  PAD /PROCESS_MEMORY_COUNTERS_EX DUMP CR
  GetCurrentProcess EmptyWorkingSet DROP WorkingSetSize . PagefileUsage . CR CR
; MTEST
