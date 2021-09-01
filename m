Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D83FDD3D
	for <lists+drbd-dev@lfdr.de>; Wed,  1 Sep 2021 15:44:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7E9CE42061C;
	Wed,  1 Sep 2021 15:44:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
	[209.85.222.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0CDC1420043
	for <drbd-dev@lists.linbit.com>; Wed,  1 Sep 2021 15:43:58 +0200 (CEST)
Received: by mail-ua1-f50.google.com with SMTP id m39so1349462uad.9
	for <drbd-dev@lists.linbit.com>; Wed, 01 Sep 2021 06:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gWwkSDKtYGpqljVYI1y+WfrFXR09Q3LdZi5r8xigkjk=;
	b=YLheoMqIAr0yoljjNb2cZY3mfbJjEBV1ghX/7mluGOPdZNf5KsaKyBul/7mBbedP6P
	+FsDmoAvosN+BwsEZqgs/gKQsn4vSO8OuKeXoCfwMs8GLJatbK33k0ra0es3zRk+oFIA
	k08iJ+ZuId/RpRMm1tn8EnhdGOyXBpkeeXEKV/3dUpncwy0SUZ02pflVTrNldH4quDrA
	MlFwlnUJ+o3rE0BhGAkvTna4CxoF3hMwMGOi81nmZ3GZ7VX3wFr1SSzkMbWgmclzHCgy
	qXN2rSSLwlilwkLZzwFwpZOW29uBbcLHKkoQlCapKt/l1KlMTvZUtzGTxkm1SGAM0ON6
	PvKA==
X-Gm-Message-State: AOAM533iiFe+RpezJhCyUju4WkevwrUJb74mbA1UAmxukWk7uXKOtQRR
	ph3cEVlULLUOumSLkYWzrRJjMk+R8ascXnfg9HE=
X-Google-Smtp-Source: ABdhPJwQuBYdXPN25peyItUun+pLAld/i8v6Ep8jdmiUeF2ltHZxB5QeDFZxYSpkK7+IOC5bnXvgZm+ETQziLUn4arE=
X-Received: by 2002:ab0:2989:: with SMTP id u9mr22973907uap.122.1630503838209; 
	Wed, 01 Sep 2021 06:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210830221000.179369-1-mcgrof@kernel.org>
	<20210830221000.179369-4-mcgrof@kernel.org>
In-Reply-To: <20210830221000.179369-4-mcgrof@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Sep 2021 15:43:46 +0200
Message-ID: <CAMuHMdXCUhrnXSmjFP7nJKHZp2joVRz-Ka2BUNMcZFA06CJ1wQ@mail.gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, justin@coraid.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	Tim Waugh <tim@cyberelk.net>, Lars Ellenberg <drbd-dev@lists.linbit.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	"open list:TENSILICA XTENSA PORT \(xtensa\)"
	<linux-xtensa@linux-xtensa.org>, Johannes Berg <johannes.berg@intel.com>,
	Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
	linux-block@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
	Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
	Chris Zankel <chris@zankel.net>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	chris.obbard@collabora.com, Tejun Heo <tj@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, thehajime@gmail.com,
	YiFei Zhu <zhuyifei1999@gmail.com>
Subject: Re: [Drbd-dev] [PATCH 03/15] m68k/emu/nfblock: add error handling
	support for add_disk()
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

On Tue, Aug 31, 2021 at 12:10 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
