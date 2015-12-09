CarrierWave.configure do |config|
	config.fog_credentials = {
		:provider               => 'AWS',
		:aws_access_key_id      => 'AKIAINCG2M7427VYRCXA',
		:aws_secret_access_key  => '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',
		:path_style            => true,
		:region					=> 'us-west-2'
	}
	config.fog_directory  = 'intern-betas'
	config.fog_public     = false
	config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end