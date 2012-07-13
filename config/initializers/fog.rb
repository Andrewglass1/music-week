CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJRQSYVX45NMJDPFA',       # required
    :aws_secret_access_key  => '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',       # required
  }
  config.fog_directory  = 'andysongs'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end