//
//  SignUpEnum.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/20.
//

enum SignUpAlertMessage: String {
    case INVALID_ID = "5~20자의 영문 소문자, 숫자와 특수기호_,- 만 사용 가능합니다."
    case VALID_ID = "사용 가능한 아이디입니다."
    
    case PASSWORD_WRONG_LENGTH =  "8~16자의 영문 대소문자,숫자,특수기호만 사용 가능합니다."
    case PASSWORD_NO_CAPITAL = "영문 대문자를 최소 1자 이상 포함해주세요."
    case PASSWORD_NO_NUMBER = "숫자를 최소 1자 이상 포함해주세요."
    case PASSWORD_NO_SPECIAL =  "특수문자를 최소 1자 이상 포함해주세요."
    case VALID_PASSWORD = "안전한 비밀번호입니다."
    
    case CONFIRM_PASSWORD_NOT_MATCH = "비밀번호가 일치하지 않습니다."
    case VALID_CONFIRM_PASSWORD = "비밀번호가 일치합니다."
    
    case NAME_EMPTY = "이름은 필수 입력 항목입니다"
}


enum SignUpPlaceholder: String {
    case ID = "영문 소문자, 숫자, 특수기호(_,-) 5~20자"
    case PASSWORD = "영문 대/소문자, 숫자, 특수문자(!@#$%) 8~16자"
}
