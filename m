Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 963BD4C7A8B
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 21:37:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 756CE421783;
	Mon, 28 Feb 2022 21:37:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 539E542177F
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 21:37:35 +0100 (CET)
Received: by mail-lf1-f53.google.com with SMTP id g39so23359253lfv.10
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 12:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S/LNP14iVGpJY7HEU3KoWC3rGBeIOldyeXi/18P4YEg=;
	b=JCfpf2EkV0u8p2DIwI3SoZoRhHthQMEAy9/7LEkowc8JnTmPgsFXHlzh4U3t+Q6SEk
	Lc7ftzGO2kIrejoWkV3dzzd0jpx1zu67BigJ1Dmt6MH2aSREOTU5VOooJKZjMGKU+kco
	F0IyOo2hDxkf3WtcbllN4ffR7kqC0AZqO0I4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S/LNP14iVGpJY7HEU3KoWC3rGBeIOldyeXi/18P4YEg=;
	b=RqJA2k+HfKpf6UUoCP/VGk9Xuaj9UoAZdfy7pjh4FOyxdjBk5eKpeqqntnvB8Y9Syx
	781OJZ5BPbJTq63AzxAVQ71i6jl6Fxst6eSs81DntWxTAabnut2cHl9WlzsF1GaibNdV
	tZQURw23SjdAehgGQ8v8kjwRm1iaOP3J/mgyQ2BCiWorXYZkoCPaB2FX7k2G+ZzpDjBt
	dqRCMn9XOAoFxrXGk1y3NTBKparXSEuvEHg4lxtJ2Q4c38u4knfhmNtgmz/+isdBuAgW
	o9NFEqOOmCjKH+tH7s1FL4UX3hYMLl6eCCLeBkLv8vrICoZZL0CY1x42mKMaxTOjFoXt
	r7SA==
X-Gm-Message-State: AOAM530PPD/1yHOqwYy+5Z5qew57MMSLtuQmX/MI7r9c6lUPihqnA8fB
	4jHsMjdLpHVaPLW317dHPIvFZoKd6rkjmgyGVVg=
X-Google-Smtp-Source: ABdhPJzNuznU0k8939eLCE5sDEfAQmKJTHeek/WTc4SDj08gEvTD8Qg8c5+0ZAAYbQPXF4GUA6F8Jw==
X-Received: by 2002:ac2:549a:0:b0:443:f15d:e582 with SMTP id
	t26-20020ac2549a000000b00443f15de582mr14152815lfk.90.1646080654442;
	Mon, 28 Feb 2022 12:37:34 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
	[209.85.208.174]) by smtp.gmail.com with ESMTPSA id
	t12-20020a056512208c00b0044572ace71asm1126385lfr.200.2022.02.28.12.37.32
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 28 Feb 2022 12:37:32 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id t14so19048360ljh.8
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 12:37:32 -0800 (PST)
X-Received: by 2002:a2e:924d:0:b0:246:370c:5618 with SMTP id
	v13-20020a2e924d000000b00246370c5618mr15158756ljg.358.1646080652034;
	Mon, 28 Feb 2022 12:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	<CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
	<CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
	<Yh0tl3Lni4weIMkl@casper.infradead.org>
In-Reply-To: <Yh0tl3Lni4weIMkl@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:37:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
Message-ID: <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
	alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos,
	H.J." <h.j.bos@vu.nl>, linux1394-devel@lists.sourceforge.net,
	drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
	linux-scsi <linux-scsi@vger.kernel.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
	kgdb-bugreport@lists.sourceforge.net,
	bcm-kernel-feedback-list@broadcom.com,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
	Linux PM <linux-pm@vger.kernel.org>,
	intel-gfx <intel-gfx@lists.freedesktop.org>,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	v9fs-developer@lists.sourceforge.net,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Mon, Feb 28, 2022 at 12:16 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> Then we can never use -Wshadow ;-(  I'd love to be able to turn it on;
> it catches real bugs.

Oh, we already can never use -Wshadow regardless of things like this.
That bridge hasn't just been burned, it never existed in the first
place.

The whole '-Wshadow' thing simply cannot work with local variables in
macros - something that we've used since day 1.

Try this (as a "p.c" file):

        #define min(a,b) ({                     \
                typeof(a) __a = (a);            \
                typeof(b) __b = (b);            \
                __a < __b ? __a : __b; })

        int min3(int a, int b, int c)
        {
                return min(a,min(b,c));
        }

and now do "gcc -O2 -S t.c".

Then try it with -Wshadow.

In other words, -Wshadow is simply not acceptable. Never has been,
never will be, and that has nothing to do with the

        typeof(pos) pos

kind of thing.

Your argument just isn't an argument.

              Linus
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
