CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = ENV.fetch('S3_BUCKET_NAME') # for AWS-side bucket access permissions config, see section below
  config.aws_acl    = 'private'

  # Optionally define an asset host for configurations that are fronted by a
  # content host, such as CloudFront.
  config.asset_host = 'http://example.com'

  # The maximum period for authenticated_urls is only 7 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  # Set custom options such as cache control to leverage browser caching.
  # You can use either a static Hash or a Proc.
  config.aws_attributes = -> { {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  } }

  config.aws_credentials = {
    bucket:            ENV.fetch('unicefbaby-production-bucket'),
    access_key_id:     ENV.fetch('AKIAUDRKOFKJ7INF4UIX'),
    secret_access_key: ENV.fetch('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'),
    # region:            ENV.fetch('AWS_REGION'), # Required
    stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
  }
  config.aws_credentials[:endpoint] = 'https://282483108499.signin.aws.amazon.com/console'

  # Optional: Signing of download urls, e.g. for serving private content through
  # CloudFront. Be sure you have the `cloudfront-signer` gem installed and
  # configured:
  # config.aws_signer = -> (unsigned_url, options) do
  #   Aws::CF::Signer.sign_url(unsigned_url, options)
  # end
end
