# Pull Request 검토 및 병합 가이드

## 현재 상태
- GitHub 리포지토리: https://github.com/HOYALIM/Mortgage-Inequality-Explorer
- 열린 PR: 1개 확인됨

## Pull Request 검토 방법

### 1. GitHub 웹 인터페이스에서 검토

#### PR 목록 확인
1. 리포지토리 페이지로 이동: https://github.com/HOYALIM/Mortgage-Inequality-Explorer
2. "Pull requests" 탭 클릭
3. 열린 PR 목록 확인

#### PR 상세 검토
각 PR을 클릭하여 다음을 확인:

**기본 정보 확인**
- PR 제목과 설명
- 작성자 (Author)
- 생성일 및 마지막 업데이트
- Base 브랜치 (보통 `main`)와 Compare 브랜치

**변경사항 확인**
- "Files changed" 탭에서 변경된 파일 목록 확인
- 각 파일의 diff 확인:
  - 추가된 코드 (녹색)
  - 삭제된 코드 (빨간색)
  - 수정된 코드
- 인라인 댓글 추가 가능

**코드 검토 체크리스트**
- [ ] 코드가 프로젝트 스타일 가이드를 따르는가?
- [ ] 버그나 오류가 없는가?
- [ ] 테스트가 통과하는가? (CI/CD 상태 확인)
- [ ] 문서화가 충분한가?
- [ ] 성능에 영향을 주지 않는가?
- [ ] 보안 이슈가 없는가?

**CI/CD 상태 확인**
- PR 페이지 상단의 체크마크/엑스 표시 확인
- 모든 테스트가 통과했는지 확인
- 빌드가 성공했는지 확인

### 2. 로컬에서 검토 (선택사항)

```bash
# PR 브랜치를 로컬로 가져오기
git fetch origin
git checkout -b <pr-branch-name> origin/<pr-branch-name>

# 변경사항 확인
git log main..<pr-branch-name>
git diff main..<pr-branch-name>

# 코드 실행 및 테스트
# (프로젝트에 맞는 테스트 명령어 실행)
```

### 3. 댓글 및 피드백 제공

**리뷰 댓글 작성**
1. PR 페이지에서 "Review changes" 버튼 클릭
2. 파일의 특정 라인에 인라인 댓글 추가
3. 일반 댓글 작성
4. 리뷰 타입 선택:
   - **Comment**: 일반 피드백
   - **Approve**: 승인
   - **Request changes**: 수정 요청

**리뷰 작성 예시**
```
좋은 작업입니다! 몇 가지 제안사항이 있습니다:

1. 함수명을 더 명확하게 변경하는 것이 좋을 것 같습니다.
2. 에러 핸들링을 추가해주세요.
3. 테스트 케이스를 추가해주세요.

전반적으로 좋은 변경사항입니다. 작은 수정 후 승인하겠습니다.
```

## Pull Request 병합 방법

### 방법 1: GitHub 웹 인터페이스에서 병합 (권장)

1. **PR 페이지로 이동**
   - PR 목록에서 병합할 PR 클릭

2. **병합 전 최종 확인**
   - 모든 리뷰가 완료되었는지 확인
   - CI/CD가 통과했는지 확인
   - 충돌(conflict)이 없는지 확인

3. **병합 옵션 선택**
   - "Merge pull request" 버튼 클릭
   - 병합 타입 선택:
     - **Create a merge commit**: 병합 커밋 생성 (기본값, 권장)
     - **Squash and merge**: 모든 커밋을 하나로 합침
     - **Rebase and merge**: 리베이스 병합 (선형 히스토리)

4. **병합 확인**
   - "Confirm merge" 클릭
   - 병합 완료 후 "Delete branch"로 브랜치 삭제 (선택사항)

### 방법 2: 명령줄에서 병합

```bash
# 최신 main 브랜치 가져오기
git checkout main
git pull origin main

# PR 브랜치 병합
git merge <pr-branch-name>

# 충돌 해결 (있는 경우)
# git add <resolved-files>
# git commit

# main 브랜치에 푸시
git push origin main
```

### 병합 타입 설명

**Create a merge commit (병합 커밋 생성)**
- PR의 모든 커밋 히스토리 보존
- 병합 커밋이 생성됨
- 가장 안전하고 추적 가능한 방법

**Squash and merge (스쿼시 병합)**
- PR의 모든 커밋을 하나로 합침
- 깔끔한 히스토리 유지
- PR의 개별 커밋 히스토리는 사라짐

**Rebase and merge (리베이스 병합)**
- PR 커밋을 main 브랜치 위에 재배치
- 선형 히스토리 유지
- 충돌 해결이 복잡할 수 있음

## 병합 후 작업

1. **로컬 브랜치 업데이트**
   ```bash
   git checkout main
   git pull origin main
   ```

2. **병합된 브랜치 삭제**
   - GitHub에서 "Delete branch" 버튼 클릭
   - 또는 로컬에서: `git branch -d <pr-branch-name>`

3. **변경사항 확인**
   - 웹사이트/애플리케이션이 정상 작동하는지 확인
   - 로컬에서 테스트 실행

## 문제 해결

### 충돌(Conflict) 발생 시

1. **GitHub에서 해결**
   - "Resolve conflicts" 버튼 클릭
   - 웹 에디터에서 충돌 해결
   - "Mark as resolved" 클릭

2. **로컬에서 해결**
   ```bash
   git checkout <pr-branch-name>
   git merge main
   # 충돌 파일 수정
   git add <resolved-files>
   git commit
   git push origin <pr-branch-name>
   ```

### CI/CD 실패 시

1. 실패 원인 확인 (로그 확인)
2. PR 작성자에게 알림
3. 수정 후 재시도

## Best Practices

1. **코드 리뷰는 신중하게**
   - 충분한 시간을 들여 검토
   - 건설적인 피드백 제공

2. **작은 PR 선호**
   - 한 번에 많은 변경사항보다 작은 단위로 나누기
   - 검토와 이해가 쉬움

3. **명확한 설명**
   - PR 제목과 설명이 명확해야 함
   - 변경 이유와 목적 명시

4. **테스트 필수**
   - 병합 전 로컬에서 테스트
   - CI/CD 통과 확인

5. **타이밍**
   - 중요한 변경사항은 팀과 논의 후 병합
   - 배포 전 확인

## 현재 PR 확인 방법

```bash
# GitHub CLI 사용 (설치된 경우)
gh pr list

# 또는 웹 브라우저에서
# https://github.com/HOYALIM/Mortgage-Inequality-Explorer/pulls
```

## 참고 링크

- GitHub PR 가이드: https://docs.github.com/en/pull-requests
- Git 병합 가이드: https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging

