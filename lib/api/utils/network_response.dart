///  A Bridge class that encapsulates the response [data] gotten from a service class.
///
/// It provides provides a message property [message], giving more information on the data.
/// It provides a boolean [success], informing the state of the service call.
/// It provides the status code [code] of the response receieved.
class NetworkResponse {
  String message;
  bool success;
  dynamic data;
  int code;

  NetworkResponse({
    this.message = "An unknown response received.",
    this.success = false,
    this.data,
    this.code = 500,
  });

  /// Named Constructor of a succesful network response
  NetworkResponse.success({
    this.message = "Operation Successful",
    this.data,
    this.success = true,
    this.code = 200,
  });

  /// Named Constructor of an unknown network response
  NetworkResponse.warning({
    this.message = 'An unknown response received.',
    this.data,
    this.success = false,
    this.code = 400,
  });

  /// Named Constructor of an erroneuos network response
  NetworkResponse.error({
    this.message = 'An error occur, try again later.',
    this.data,
    this.success = false,
    this.code = 500,
  });
}
