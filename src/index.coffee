
BROWSER_TYPE_WECHAT = "wechat"
BROWSER_TYPE_ANDROID = "android"
BROWSER_TYPE_IE = "id"
BROWSER_TYPE_360 = "360"
BROWSER_TYPE_MAXTHON = "maxthon"
BROWSER_TYPE_OPERA = "opera"
BROWSER_TYPE_UNKNOWN = "unknown"

EMPTY_OBJ = {}
win = window || EMPTY_OBJ
nav = win.navigator || EMPTY_OBJ
ua = String(nav.userAgent || "").toLowerCase()

IsMobile = ua.indexOf('mobile') isnt -1 || ua.indexOf('android') isnt -1

CurrLanguage = nav.language || nav.browserLanguage || ""
CurrLanguage = currLanguage.split("-")[0] || "en"

IsAndroid = false
IsiOS = false
OsVersion = ''
OsMainVersion = 0

uaResult = /android (\d+(?:\.\d+)+)/i.exec(ua) || /android (\d+(?:\.\d+)+)/i.exec(String(nav.platform|| ""))

if uaResult
  IsAndroid = true
  OsVersion = uaResult[1] || ''
  OsMainVersion = parseInt(osVersion) || 0

uaResult = /(iPad|iPhone|iPod).*OS ((\d+_?){2,3})/i.exec(ua)
if uaResult
  IsiOS = true
  OsVersion = uaResult[2] || ''
  OsMainVersion = parseInt(osVersion) || 0


BrowserType = "unknown"

typeReg1 = /mqqbrowser|sogou|qzone|liebao|micromessenger|ucbrowser|360 aphone|360browser|baiduboxapp|baidubrowser|maxthon|mxbrowser|trident|miuibrowser/i
typeReg2 = /qqbrowser|chrome|safari|firefox|opr|oupeng|opera/i
browserTypes = typeReg1.exec(ua) || typeReg2.exec(ua)
BrowserType = if browserTypes then browserTypes[0] else BROWSER_TYPE_UNKNOWN
if BrowserType is 'micromessenger'
  BrowserType = BROWSER_TYPE_WECHAT
else if BrowserType is 'safari' and ua.match(/android.*applewebkit/)
  BrowserType = BROWSER_TYPE_ANDROID
else if BrowserType is 'trident'
  BrowserType = BROWSER_TYPE_IE
else if BrowserType is '360 aphone'
  BrowserType = BROWSER_TYPE_360
else if BrowserType is 'mxbrowser'
  BrowserType = BROWSER_TYPE_MAXTHON
else if BrowserType is 'opr'
  BrowserType = BROWSER_TYPE_OPERA



module.exports =
  IsAndroid : IsAndroid
  IsiOS : IsiOS
  OsVersion : OsVersion
  OsMainVersion : OsMainVersion
  BrowserType : BrowserType
  isWeChat : -> return BrowserType is BROWSER_TYPE_WECHAT



