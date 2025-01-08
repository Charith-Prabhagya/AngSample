<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName"
                           value="${(register.formData.firstName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                    />

                    <#if messagesPerField.existsError('firstName')>
                        <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName"
                           value="${(register.formData.lastName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                    />

                    <#if messagesPerField.existsError('lastName')>
                        <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" class="${properties.kcInputClass!}" name="email"
                           value="${(register.formData.email!'')}" autocomplete="email"
                           aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    />

                    <#if messagesPerField.existsError('email')>
                        <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="username" class="${properties.kcInputClass!}" name="username"
                               value="${(register.formData.username!'')}" autocomplete="username"
                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                        />

                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="password" id="password" class="${properties.kcInputClass!}" name="password"
                               autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                        />

                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-confirm"
                               class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="password" id="password-confirm" class="${properties.kcInputClass!}"
                               name="password-confirm"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />

                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.phone" class="${properties.kcLabelClass!}">${msg("phone")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="user.attributes.phone" class="${properties.kcInputClass!}" name="user.attributes.phone"
                           value="${(register.formData['user.attributes.phone']!'')}"
                    />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.receiveMarketingMails" class="${properties.kcLabelClass!}">${msg("receiveMarketingMails")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <select class="form-control" id="user.attributes.receiveMarketingMails" name="user.attributes.receiveMarketingMails">
                        <option value="false" <#if (register.formData['user.attributes.receiveMarketingMails'])?? && register.formData['user.attributes.receiveMarketingMails'] == "false">selected</#if> >false</option>
                        <option value="true" <#if (register.formData['user.attributes.receiveMarketingMails'])?? && register.formData['user.attributes.receiveMarketingMails'] == "true">selected</#if> >true</option>
                    </select>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.receiveReleaseInfoMails" class="${properties.kcLabelClass!}">${msg("receiveReleaseInfoMails")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <select class="form-control" id="user.attributes.receiveReleaseInfoMails" name="user.attributes.receiveReleaseInfoMails">
                        <option value="false" <#if (register.formData['user.attributes.receiveReleaseInfoMails'])?? && register.formData['user.attributes.receiveReleaseInfoMails'] == "false">selected</#if> >false</option>
                        <option value="true" <#if (register.formData['user.attributes.receiveReleaseInfoMails'])?? && register.formData['user.attributes.receiveReleaseInfoMails'] == "true">selected</#if> >true</option>
                    </select>
                </div>
            </div>

            <#--  <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.receiveMarketingMails" class="${properties.kcLabelClass!}">${msg("receiveMarketingMails")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">  -->
                    <#--  <input type="checkbox" id="user.attributes.receiveMarketingMails" class="${properties.kcInputClass!}" name="user.attributes.receiveMarketingMails"
                           value="true" <#if (account.attributes.receiveMarketingMails?? && account.attributes.receiveMarketingMails)?string('true', 'false') == 'true'>checked</#if>
                    />  -->
                    <#--  <#if register.attributes.receiveMarketingMails??>
                        <input class="larger-checkbox" id="user.attributes.receiveMarketingMails" name="user.attributes.receiveMarketingMails" type="checkbox" checked/>
                    <#else>
                        <input class="larger-checkbox" id="user.attributes.receiveMarketingMails" name="user.attributes.receiveMarketingMails" type="checkbox"/>
                    </#if>
                </div>
            </div>  -->

            <#--  <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.receiveReleaseInfoMails" class="${properties.kcLabelClass!}">${msg("receiveReleaseInfoMails")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="checkbox" id="user.attributes.receiveReleaseInfoMails" class="${properties.kcInputClass!}" name="user.attributes.receiveReleaseInfoMails"
                           value="true" <#if (account.attributes.receiveReleaseInfoMails?? && account.attributes.receiveReleaseInfoMails)?string('true', 'false') == 'true'>checked</#if>
                    />
                </div>
            </div>  -->

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>