import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['captcha', 'submit', 'response']

  connect() {
    this.submitTarget.disabled = true

    hcaptcha.render(this.captchaTarget, {
      sitekey: this.siteKey,
      callback: response => {
        this.responseTarget.value = response
        this.submitTarget.disabled = false
      }
    })
  }

  get siteKey() {
    return document
      .querySelector('meta[name="hcaptcha-sitekey"]')
      .getAttribute('content')
  }
}
