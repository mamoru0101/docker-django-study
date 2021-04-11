from django.conf import settings


def trial_mode(request):
    extra_ctx = {}
    if settings.TRIAL_MODE:
        extra_ctx.update(
            TRIALMODE=True,
            trial_text="試用版"
        )
    return extra_ctx
