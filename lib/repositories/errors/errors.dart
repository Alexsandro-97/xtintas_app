abstract class IExecption implements Exception {}

class ExceptionNotFound extends IExecption {}

class ExceptionUserAlreadyExists extends IExecption {}

class ExceptionUserNotRedistered extends IExecption {}
