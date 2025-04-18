#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# eClass 실행 래퍼

set -e

# ── 루트 디렉터리 탐지 ───────────────────────────── #
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$SCRIPT_DIR"

VENV_DIR="$ROOT_DIR/bin/eclass-venv"
VENV_PY="$VENV_DIR/bin/python"
PIP_EXE="$VENV_DIR/bin/pip"
PY_SCRIPT="$ROOT_DIR/bin/eclass_downloader.py"

# ── 가상환경 준비 ────────────────────────────────── #
if [ ! -x "$VENV_PY" ]; then
  echo "[가상환경 준비] 가상환경 생성 중..."
  python3 -m venv "$VENV_DIR"
  echo "[가상환경 준비] 패키지 설치 중..."
  "$PIP_EXE" install --upgrade pip
  "$PIP_EXE" install selenium requests
fi

# ── 스크립트 실행 ────────────────────────────────── #
exec "$VENV_PY" "$PY_SCRIPT" "$@"
