// utilities のネームスペース
const util = {};

/**
 * 文字列のバイト数を判定する
 * @param s 文字列
 * @returns 文字列のバイト数 
 */
util.bytes = (s) => {
  s = (s === null || typeof s === "undefined") ? "" : s;
  return encodeURI(s).replace(/%../g, "*").length;
}

/**
 * 文字列が空文字かどうかをチェックする
 * @param s 判定する文字列
 * @returns true:空文字 false:空文字ではない
 */
util.isEmpty = (s) => {
  return s === null || s === "" || typeof s === "undefined";
}

/**
 * 文字列の"true" / "false"をbooleanに変換する
 * @param s 変換する文字列 ("true" / "fales")
 * @returns boolean
 */
util.toBoolean = (s) => {
  return s.toLowerCase() === "true";
}

/**
 * HTML要素のclass名を配列として取得する
 * @param element class名を取得したい要素
 * @returns 対象要素に付与されているclass名の配列
 */
util.getClassNames = (element) => {
  return (element) ? element.className.split(" ") : [];
};