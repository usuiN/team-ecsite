/**
 * バリデーション用の定数を持つオブジェクトネームスペース
 */
const validateConstants = {
  ERR_MSG: {
    USERNAME_DUPLICATED: "入力されたユーザー名は既に存在しています。\n別のユーザー名をお試しください。",
    EMPTY: "未入力です。",
    OVER_MAX: "文字数が最大値を超えています。",
    UNDER_MIN: "文字数が最小値未満です。",
    NOT_ONLY_HIRAGANA: "平仮名以外の文字が含まれています。",
    NOT_ONLY_ALPHANUMERIC: "半角英数字以外の文字が含まれています。",
    NOT_ONLY_NUMERIC: "半角数字以外の文字が含まれています。",
    INVALID_FORMAT: "書式が不正です。",
  },
  FAMILY_NAME_MAX: 16,
  FIRST_NAME_MAX: 16,
  FAMILY_NAME_KANA_MAX: 16,
  FIRST_NAME_KANA_MAX: 16,
  USER_NAME_MIN: 3,
  USER_NAME_MAX: 32,
  PASSWORD_MIN: 6,
  PASSWORD_MAX: 16,
  TEL_NUMBER_MIN:10,
  TEL_NUMBER_MAX:13,
  ADDRESS_MAX:50
}

/**
 * バリデーション用の汎用メソッドを持つオブジェクトネームスペース
 */
const validator = {
  // 引数 target が半角英数字か判定する
  isHalfAlphanumeric: (target) => {
    target = (target === null) ? "" : target;
    target = target.trim();
    return target.match(/^[0-9a-zA-Z]+$/);
  },
  // 引数 target がひらがなか判定する
  isHiragana: (target) => {
    target = (target === null) ? "" : target;
    target = target.trim();
    return target.match(/^[ぁ-んー]+$/);
  },
  // 引数 target が空か判定する
  isEmpty: (target) => {
    return target === null || target === "" || typeof target === "undefined";
  },
  // 引数 target の文字数が最大値を超えているか判定する
  overMax: (target, max) => {
    if (validator.isEmpty(target)) return false;
    return target.length > max;
  },
  // 引数 target の文字数が最小値未満か判定する
  underMin(target, min) {
    if (validator.isEmpty(target)) return true;
    return target.length < min;
  },
  // 引数 target がメールアドレスの書式か判定する
  isMailAddress: (target) => {
    target = (target === null) ? "" : target;
    return target.match(/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/);
  },
  // 引数 target が電話番号の書式か判定する
  isHalfNumeric: (target) => {
    target = (target === null) ? "" : target;
    return target.match(/^[0-9]+$/);
  },
};
