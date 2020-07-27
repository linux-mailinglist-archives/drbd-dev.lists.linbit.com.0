Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DDA22E64C
	for <lists+drbd-dev@lfdr.de>; Mon, 27 Jul 2020 09:17:03 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D5493420473;
	Mon, 27 Jul 2020 09:17:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5CA4B420317
	for <drbd-dev@lists.linbit.com>; Mon, 27 Jul 2020 09:17:01 +0200 (CEST)
Received: by mail-ed1-f54.google.com with SMTP id i26so8027032edv.4
	for <drbd-dev@lists.linbit.com>; Mon, 27 Jul 2020 00:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gMH9yVHliKl5oRMLGuP+HKrsXT1jj8Tjp5dV80TpNWY=;
	b=IwU0EhB6vN7hFyeSYIS2gmlK+Mvs+XJSRrp3zf4QBHX5X0ybjuAaam3n8MG/e6NtE1
	WFaStgl2yYjqsVKAu8cUf/68PlgPuqnRt2DVT/7EQtLu64Y68d3wrPFrv0k8LT6K0cuv
	mR/QsU0kafe9G8sLrXhHcMNXy9TpspKa5Ku/ImPIjM0CYBogtxrLePFUeBTcCWhK+REh
	lU/wTNq5CMd14aVuLvi6tAjrNa9C2JxYnRvjuv1h7P/6R3ULfBjnedE8iUwWUeLT2b/3
	EAJ6wH3g7/TtFsO7dOV/gij06owJoAjU8L4bCC2p/DAHOSsOuSq26R7GRnDCyZph3FuD
	99JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=gMH9yVHliKl5oRMLGuP+HKrsXT1jj8Tjp5dV80TpNWY=;
	b=giF/jRhfl/01evkaCSUIVjXAk4E5yikomQ0CjEz/bbZRjO/NxFQsirb4Yfu+e62K7b
	oKsCOmREPx0EyrsGaNqTk7pl0z/rVdziHzMpebeRKSgtig8tvuKC2QObAOZ3zYkJJuPb
	pBl5N+Tl95IXgVDCglGLZmyKWbzX6NBfWyV1KDfwcgB97r2AsI9R436c0MbZFEtfoFak
	5Tk2WL41gj7xidXfpBEkMd8sWMp2YC7iD77vcV+NsBA3yG2d+2SJe+MqGpbhGEpPiG0C
	hl/DpFO4JcYJGvqd9JCXZqb4eZv8XoZsDQDex3imw22vkIb2Ie+O/ESJDjVoTlG94TzM
	10YA==
X-Gm-Message-State: AOAM5329Vj+VmYkS6yp2gP1tVxr5DgmRaPAz5Py7pxR5tzBnu/yGwABk
	SGdt3c01TRcxBV71+nr/zVVq3YE73DqZ/Hld
X-Google-Smtp-Source: ABdhPJyEbcwVLoPbvJMjfo1AkubFQNEsxOH7AESvUq+IEZ63AoJPdCEz8xWRQYnUOafTVN6+2ZaPXA==
X-Received: by 2002:aa7:c95a:: with SMTP id h26mr7608885edt.289.1595834220590; 
	Mon, 27 Jul 2020 00:17:00 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214])
	by smtp.gmail.com with ESMTPSA id w5sm2052616edi.74.2020.07.27.00.16.59
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 27 Jul 2020 00:17:00 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:16:58 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: Sarah Newman <srn@prgmr.com>
Message-ID: <20200727071658.GH4222@soda.linbit>
Mail-Followup-To: Sarah Newman <srn@prgmr.com>, drbd-dev@lists.linbit.com
References: <308845ca-17a3-43d0-b7ad-80069d9bc17f@prgmr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <308845ca-17a3-43d0-b7ad-80069d9bc17f@prgmr.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] Bug(s) with Linux v5.4.46
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

On Sun, Jul 26, 2020 at 08:55:10PM -0700, Sarah Newman wrote:

> 	kref_put(&device->kref, drbd_destroy_device);

At this point we are "sure" to still hold at least one
additional reference on device.

> 	del_gendisk(device->vdisk);
> 	synchronize_rcu();

which we put here:

> 	kref_put(&device->kref, drbd_destroy_device);


But what you present here shows that in your case that is not true.

There is nothing DRBD specific new in the mentioned kernel version.

> In drbd_destroy_device, there is the line:
> 
> memset(device, 0xfd, sizeof(*device));
> 
> So I think that drbd_destroy_device must have run before del_gendisk,
> and therefore the reference count for device->kref is unbalanced.

Looks like it.

> I do not know if this is related to the error message:
> 
>  ASSERTION FAILED: connection->current_epoch->list not empty
> 
> or not.
> 
> There were no error messages reported on the peer.
> 
> FYI, when we've run in debug mode we've seen some ODEBUG errors about
> freeing active objects around the time that DRBD resources were released.
> One was a work_struct and the other was a timer_list. I do not know if
> either of those are related.

You want to show them? Maybe they help in understanding what is going on here.


> The system in question is still up and running in an error state; is
> there any more information you want from it?

No.

But: is this "easily" reproducible? If so: how?

    Lars

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
