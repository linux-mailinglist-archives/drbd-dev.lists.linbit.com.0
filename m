Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5D94BB935
	for <lists+drbd-dev@lfdr.de>; Fri, 18 Feb 2022 13:33:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7F66242177E;
	Fri, 18 Feb 2022 13:33:09 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
	[209.85.218.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4C82E421779
	for <drbd-dev@lists.linbit.com>; Fri, 18 Feb 2022 13:32:56 +0100 (CET)
Received: by mail-ej1-f51.google.com with SMTP id bg10so14725732ejb.4
	for <drbd-dev@lists.linbit.com>; Fri, 18 Feb 2022 04:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vdUcNoozUcUcZzUPf1kuCAlN5haAguFUjRC9L8UwwMA=;
	b=rS1s/Ie9TCTuLZMhFw1q5HCfup8g/nWEJgi0/PgK66fAs084IXxjMvz7DFVDTkn9DK
	7r5sKnifCteyso+PuSgthBRLVF9NyqqU9bUrHBejLzEoloF6QtkvAyKN15F/nb5Ji/S9
	bHV84CJvgBfZZtAiIKoBni3IIr7tVl83rbVRI8ywo7HzxcaWHJ4ZMxglq+lQxtp/zbMQ
	0h6cVr6nw8rAwlUoYAyW1+4+Bpl4ZWMAp5yPaVWl23I1+Q6CA5Grd9PlCggx4CvRQtI+
	kWLXGeG9al/mhW9Gex+5ERDNPb64qYPxpx0SAhFJCcAabXkhg60jHLROa/gYvisdYOyA
	c5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vdUcNoozUcUcZzUPf1kuCAlN5haAguFUjRC9L8UwwMA=;
	b=YUfjOVAXKJ1YEya22GHU56z/m55XgJ52RpQF7dypm8igf//24Nk2bgEUKCDBpzWYhV
	eJOjFbNMwgv+MkxtCMDFgSAEoVvLnkd6nXAs/+DZB0FAiRGBQTHFNs2n2kOEQj5BJVQc
	bYl/QP/hfsjvIy/cTTujoxZ4KbLJeUsc1NvZGkKC8F3SwzbDq7X78YfW0szDuNh5KME1
	8zuyi+DDkdxuPN2XNb1rVdR8a2Y3p77HEbTpaMyvtIQ7zRJ7SFXOXinOHr5xr7h8nLbL
	YOsGUcLC1akmACFSDzrLFcVfWCPFmkBFss9Zx1phbQIBIrlULAYJXHWFPdoXlEruIRgE
	osZA==
X-Gm-Message-State: AOAM533IW82VMUf9rJdr2SiJiMI5SL/kPfffbI5ao70T9AO+Hf6SCNdN
	zwnYKvn1/9KlmDQOrz8paqjHSWi+hzpWP/UPXcAGUA+J
X-Google-Smtp-Source: ABdhPJx+sk01vz7SH+U6AYJxLSwD0Cy1dGqT3H/Rp3cfk6aSdqqySKF/FeGLxsqkt1D//BQ3lPGarKj1Xy94VmkVfNs=
X-Received: by 2002:a17:906:824c:b0:6b8:d8e:c44c with SMTP id
	f12-20020a170906824c00b006b80d8ec44cmr6283452ejx.548.1645187575821;
	Fri, 18 Feb 2022 04:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20220218083713.3645497-1-rui.xu@easystack.cn>
In-Reply-To: <20220218083713.3645497-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Fri, 18 Feb 2022 13:32:45 +0100
Message-ID: <CAGNP_+Wmwm7spGK+ba99mVo6us6bu32KHmr1h8sup+LPCQTw9w@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd:don't increase unacked_cnt when resync
 write error
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Looks good to me for drbd-9.0. We would have to take care with the
merge up to the actively maintained branches in order to avoid losing
the drbd_handle_io_error() call. I suggest we just add the condition
to the !__test_and_set_bit(__EE_SEND_WRITE_ACK,...) check. The extra
drbd_set_out_of_sync() call is harmless and it keeps the branches
similar.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
