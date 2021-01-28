Rails.configuration.stripe = {
  publishable_key: 'pk_test_0EpfUsABzJ23tfoJgKOBBuXb00ZFYwKmGJ',
  secret_key: 'sk_test_zCfcR9wfcVUcLIDZtDygEmTv00C0rZmAkW'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

