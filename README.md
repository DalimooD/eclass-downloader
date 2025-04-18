# 중앙대학교 eClass 강의 다운로더 (macOS)

`중앙대학교 eClass 강의 다운로더`는 중앙대학교 eClass 플랫폼의 강의를 자동으로 다운로드하는 Python 스크립트입니다. 현재 페이지는 **macOS용** 프로그램 설치를 안내하고 있습니다.
스크립트는 **헤드리스(Headless) Chrome**과 **가상환경(venv)** 기반으로 동작하도록 설계되었습니다.

---

## 주요 기능

- 강좌 URL을 입력하면 해당 강좌의 전체 모듈(강의) 목록을 자동으로 수집
- 비디오 스트림(MP4 혹은 m3u8) 자동 탐지 및 다운로드 링크 저장
- 지정한 강의만 선택 다운로드 가능 (전체, 번호 지정, 범위 지정, 제외 지정)
- 재생 중단 지점에서 이어보기 지원
- 헤드리스 Chrome `--mute-audio` 옵션으로 소리 제거 및 불필요 로그 억제
- Windows용 `.bat` 및 macOS용 `.command` 실행 래퍼 스크립트 제공

---

## 사전 요구사항

- Python 3.8 이상
- Git 설치
- Chrome 또는 Chromium 브라우저 (버전 호환)
- ChromeDriver (브라우저 버전과 일치하는 드라이버)

---

## 설치 및 설정

1. 저장소 클론

   ```bash
   git clone https://github.com/DalimooD/eclass-downloader_macOS.git  # macOS 버전
   git clone https://github.com/DalimooD/eclass-downloader_Windows.git # Windows 버전
   cd eclass-downloader_${OS}
   ```

2. 가상환경 생성 및 진입

   ```bash
   python3 -m venv ./bin/eclass-venv
   source ./bin/eclass-venv/bin/activate   # macOS/Linux
   .\bin\eclass-venv\Scripts\activate    # Windows PowerShell
   ```

3. 의존 패키지 설치

   ```bash
   pip install --upgrade pip
   pip install -r requirements.txt
   ```

4. ChromeDriver 설치

   - Chrome 버전에 맞는 ChromeDriver를 [공식 사이트](https://sites.google.com/chromium.org/driver/)에서 다운로드
   - `chromedriver` 실행파일을 시스템 `PATH` 또는 프로젝트 루트의 `bin/` 폴더에 넣기

---

## 사용 방법

### macOS: `.command` 실행

```bash
chmod +x bin/eclass_downloader.command
./bin/eclass_downloader.command
```

### Windows: `.bat` 실행

```batch
bin\eclass_downloader.bat
```

스크립트가 실행되면 순서대로:
1. 가상환경을 확인/생성하고 패키지 설치
2. 브라우저를 headless 모드로 실행하고 쿠키 주입
3. 강좌 ID 입력 → 모듈 목록 수집
4. 다운로드 모드 선택 (전체, 번호, 범위, 제외)
5. m3u8 링크 혹은 MP4 파일 다운로드

다운로드된 결과물은 프로젝트 최상위의 강좌명 폴더 아래에 저장됩니다.

---

## 보안 및 주의사항

- **`bin/cookies.json`** 파일은 절대 공개 저장소에 업로드하지 마세요. 계정 세션이 포함되어 있어 탈취 위험이 있습니다.
- `.gitignore`에 이미 `bin/cookies.json`, `*.mp4`, `*.txt`, `__pycache__/` 등이 설정되어 있습니다.

---

## 기여

1. Fork 저장소
2. 새로운 브랜치에서 수정
3. Pull Request 생성

---

## 라이선스

MIT

