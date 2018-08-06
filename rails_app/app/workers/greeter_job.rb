class GreeterJob
  include Sidekiq::Worker

  def perform(name)
    logger.info "Hello, #{name}"
  end
end
