class APIS {
  APIS._();

  static const bool IS_LIVE = true;
  static const LIVE_ENDPOINT = 'https://www.abhibus.com';
  static const DEMO_ENDPOINT = 'https://demo.abhibus.com';

  //API Endpoint
  static const baseUrl = IS_LIVE ? LIVE_ENDPOINT : DEMO_ENDPOINT;

  //oms app
  static const OMS_APP = '/omsapp/';

  //auth related apis
  static const getLoginToken = '${OMS_APP}getLoginToken';
  static const forgotPassword = '${OMS_APP}forgotPassword';
  static const verifyOtp = '${OMS_APP}verifiedOtp';
  static const updatePassword = '${OMS_APP}updatePassword';
  static const logout = '${OMS_APP}logOut';

  //core feature apis
  static const getAppConfigData = '${OMS_APP}getAppConfigData';
  static const getTokenList = '${OMS_APP}getTokenList';
  static const getTokenDetails = '${OMS_APP}getTokenDetails';
  static const validateToken = '${OMS_APP}validateToken';
  static const depoTankDetails = '${OMS_APP}depoTankDetails';
  static const consumeTokendata = '${OMS_APP}consumeTokendata';
  static const getConsumeTokenHistory = '${OMS_APP}getConsumeTokenHistory';
}
