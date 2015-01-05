
class ErrorRecorder
  def service_failed(payload)
    address = payload[:address]
    #Do something

  end
end

EventBus.subscribe(ErrorRecorder.new)
