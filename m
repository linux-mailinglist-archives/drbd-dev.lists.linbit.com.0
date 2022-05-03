Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6E1517FDD
	for <lists+drbd-dev@lfdr.de>; Tue,  3 May 2022 10:37:42 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D1B084205FD;
	Tue,  3 May 2022 10:37:40 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 02B1F4202D3
	for <drbd-dev@lists.linbit.com>; Tue,  3 May 2022 10:37:39 +0200 (CEST)
Received: by mail-ed1-f42.google.com with SMTP id g23so19048602edy.13
	for <drbd-dev@lists.linbit.com>; Tue, 03 May 2022 01:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p4OixsHcQpQCje/b+iDvgbFz48v4ktCBM0uHUXLyObI=;
	b=0n1o0D+Y8fBaAikwmMqeuMafr4tuJLlRUrEv4D85OYB/RlmNJR4Xq0pMY9aORPDVFe
	AgIl1PEFP6BT4aXW4chiKrQIzggbQKSJ28i9c1jNCFS3hxr49gMAl2qte7qJyKn0ZFiE
	CPB5V0DetDgoEr6uKzRxGuT7lUWW8DgFRi4t1GIEijOnyVyCsfKCSI3ZfN706Ma4RMk+
	TLxnMN9iQnKh+tFjApvhcxc4jeUOFX72n1q+SuyXzEnBUcbmrZes7FpTuibmQxx0e+ce
	Hy/SpicEODJxTeDslSh/Mr9Hwxijc6Q6JCZTO5r0tAhUa1pXi3bF+Wye1QZlo/7aDyvv
	Qfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p4OixsHcQpQCje/b+iDvgbFz48v4ktCBM0uHUXLyObI=;
	b=uSGqANlGvUn1fTuvRLMoAUYr6DnbRikIhXWY+CRXO+zJ27PSrzts9j8mnQKAEC5XtD
	3XiNCyIwi1/EJFwHumUxhb+1FXqHbkI+m1YSYwh76ISw8bqyIu0192JB90hj+jDTjRpI
	IqDHsOFHtiWdxdFjb6un3/wHBOCAQv5Y2RgeQQHQeuHFWr9ymrQoN4NjRpvnWLzM7agy
	SlBMeTpQFjHWjCH732DNc04eYwB8RAgcJ+WiFF7Ld9yIWmcCuO4l3/wjG3jKqh5vSPaV
	xodVUM7jjPBlQlqz61vkmfXkLyt1SNrC0CAUnaL/dwZ12PcolF6XPS5kSTcn+ApnEx5l
	CBgw==
X-Gm-Message-State: AOAM5336+FuQ97H3NlTaY0AJob6bnTY5QWsFUEc6EkoaAz26+69YIUnl
	5yT/8T40LtltYqUCsG/tm6C9VaSgFVZDP4LvHTD+FLus+rKDw1qF
X-Google-Smtp-Source: ABdhPJw3XH1ZNsizj75DBrRJmbLpg9ZqzWNOnbQ8EsWF6pnM/PpLTpRBjcOMbBYU57in5zZHlLyo7IllRS52x3bjq4k=
X-Received: by 2002:a05:6402:1850:b0:425:f2e2:2594 with SMTP id
	v16-20020a056402185000b00425f2e22594mr16971384edy.3.1651567059500;
	Tue, 03 May 2022 01:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210823023359.567225-1-rui.xu@easystack.cn>
In-Reply-To: <20210823023359.567225-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Tue, 3 May 2022 09:37:28 +0100
Message-ID: <CAGNP_+Up_UN9eCVShQ=Rg5yHpkFjEUiNcBpRJTMAgYiy=uwp2A@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: change the variable ov_left to atomic
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

Hi Xu,

Your analysis of the problem seems correct to me. Some details of the
fix could be improved.

In verify_progress() there are now 3 separate atomic operations. It
would be better to use atomic64_dec_return() and then use the returned
value instead of calling atomic64_read() separately. This could have
minor effects on the behavior.

Similarly, in receive_DataRequest() there is no need to read ov_left
again after setting it. This should have no effect on the behavior,
but leads to cleaner code.

Also the repeated reads in finish_state_change() could be avoided for
cleaner code. Take care of the read after set_ov_position(), since
that changes the value of ov_left. You could use peer_device->rs_total
instead of peer_device->ov_left there, since that is what it is set to
in set_ov_position().

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
