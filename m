Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FF54C7AF7
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 21:50:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2229D42178C;
	Mon, 28 Feb 2022 21:50:32 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7B9DC421785
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 21:50:31 +0100 (CET)
Received: by mail-lj1-f175.google.com with SMTP id p20so19186821ljo.0
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 12:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qhbC6eV8gO++7ErI4p8jtmcwHU0MP2/Ov9cpdMFArow=;
	b=WVa5dIiqx38h7wrDwDC1XUsKJKiBFCag4a2cDDwm9PX3cUtT8qqZ7IT4jQUgf/P4m+
	SFGMe+WsS02R4cGzO91FNZKGdT/lUA2soxV9cxmDWvmKG61T36jSK+GypeHu4wmj47J3
	J2dEWo9WRu5EKgz1ZgjNDbSUreOeJ25KIOWY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qhbC6eV8gO++7ErI4p8jtmcwHU0MP2/Ov9cpdMFArow=;
	b=HblvubE/Xy7krkpzqtQnet1M3QQuMGz/+gjgYOv0AjcwLMHsyO+c8LukdlN+mAmhxm
	tCbG7uTORaRJMKiGxv5b2qSAXVxGdYF8y7x4JUp59Gs5oXqTVn52WQIIdMcvjonXbrNm
	1WQyvtXymuqeHDqlImFX5ewZh1Jc096V7JKLT4uVRcq2OKntcQWvTKuNqH+Ggw2eXBs4
	z0JGDFfa3h9+u+hcw67rP5Fy+GbstIQZ1RXS1Aa8iKcbBlvZOIuOGrecFK/47renSTku
	/sn9Ebdg6Jt3diKQr0eXzfQdEa1j4tp9BqrI3uBRCIQ3jjDexF+ncBI4Bw/gOWQS50w5
	w2xQ==
X-Gm-Message-State: AOAM53162qna3Ea3gTl2qpJyCuLxIbXBZGqRo/Kn1u/uhbUN6QpYSRoq
	5KUV0nxD/lHE000S3eduizF0lMeTXjlwvl5uHT0=
X-Google-Smtp-Source: ABdhPJwLWQ2z5FXYmVY5fk3ldiIfNxUQb1imVcBwnNhmxygf148ZrHXxDJW40C3clKvvuRmJE3odkw==
X-Received: by 2002:a05:651c:901:b0:245:f621:55ff with SMTP id
	e1-20020a05651c090100b00245f62155ffmr14952430ljq.247.1646081370596;
	Mon, 28 Feb 2022 12:49:30 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
	[209.85.167.53]) by smtp.gmail.com with ESMTPSA id
	v12-20020a056512096c00b00443c40a6a4csm1128361lft.134.2022.02.28.12.49.30
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 28 Feb 2022 12:49:30 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id u20so23499782lff.2
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 12:49:30 -0800 (PST)
X-Received: by 2002:a05:6512:e8a:b0:443:7b8c:579a with SMTP id
	bi10-20020a0565120e8a00b004437b8c579amr13784522lfb.687.1646080877791;
	Mon, 28 Feb 2022 12:41:17 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	<CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
	<CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
	<Yh0tl3Lni4weIMkl@casper.infradead.org>
	<e3bb7d0632f8ef60f18c19976d57330e1ef00584.camel@sipsolutions.net>
In-Reply-To: <e3bb7d0632f8ef60f18c19976d57330e1ef00584.camel@sipsolutions.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:41:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjNgWNa9njuBJEoafc-cRV3SbzZfh3m5YfxcZxdCw3+XQ@mail.gmail.com>
Message-ID: <CAHk-=wjNgWNa9njuBJEoafc-cRV3SbzZfh3m5YfxcZxdCw3+XQ@mail.gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
	alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>,
	Matthew Wilcox <willy@infradead.org>,
	linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
	linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
	kgdb-bugreport@lists.sourceforge.net,
	bcm-kernel-feedback-list@broadcom.com,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
	Linux PM <linux-pm@vger.kernel.org>,
	intel-gfx <intel-gfx@lists.freedesktop.org>, "Bos,
	H.J." <h.j.bos@vu.nl>, Nathan Chancellor <nathan@kernel.org>,
	dma <dmaengine@vger.kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	v9fs-developer@lists.sourceforge.net,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-sgx@vger.kernel.org, linux-block <linux-block@vger.kernel.org>,
	Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
	samba-technical@lists.samba.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
	tipc-discussion@lists.sourceforge.net,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mediatek@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [Drbd-dev] [PATCH 2/6] treewide: remove using list iterator
 after loop body as a ptr
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

On Mon, Feb 28, 2022 at 12:29 PM Johannes Berg
<johannes@sipsolutions.net> wrote:
>
> If we're willing to change the API for the macro, we could do
>
>   list_for_each_entry(type, pos, head, member)
>
> and then actually take advantage of -Wshadow?

See my reply to Willy. There is no way -Wshadow will ever happen.

I considered that (type, pos, head, member) kind of thing, to the
point of trying it for one file, but it ends up as horrendous syntax.
It turns out that declaring the type separately really helps, and
avoids crazy long lines among other things.

It would be unacceptable for another reason too - the amount of churn
would just be immense. Every single use of that macro (and related
macros) would change, even the ones that really don't need it or want
it (ie the good kinds that already only use the variable inside the
loop).

So "typeof(pos) pos" may be ugly - but it's a very localized ugly.

                    Linus
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
