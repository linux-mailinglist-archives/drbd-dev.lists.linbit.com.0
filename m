Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F8175C07
	for <lists+drbd-dev@lfdr.de>; Mon,  2 Mar 2020 14:47:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 055E44203C6;
	Mon,  2 Mar 2020 14:47:32 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3C93042011A
	for <drbd-dev@lists.linbit.com>; Mon,  2 Mar 2020 14:47:30 +0100 (CET)
Received: by mail-ed1-f68.google.com with SMTP id h62so11441608edd.12
	for <drbd-dev@lists.linbit.com>; Mon, 02 Mar 2020 05:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:references:in-reply-to:from
	:date:message-id:subject:to:cc;
	bh=QGW8A6NvrrWP1yUYNzkuM9Y6DPoFVb9Z8KwBG+QV5Lo=;
	b=LmTme9bU1kWOdVybK523L9bqJx/2+SXVNX723CZB72NeRygpGqwiR7kUP1xZJlj3OT
	L/ZY2sLoN/3Y9bOMVRWIpbQ6Z9PosQX2Brgcz9qIhsbNQSvUAouFiOg2nYcpYHVPvRm5
	YMPucTjSNZ9bq1O8AL0miOXzUuAjhZ1quVAQeF61NcbuQjVGuwbPCx7ggASyGN0IFUO3
	cUJnvv5OunZMVoI3KpbkPP4wGv6g067ZBMhuQrdSUmB1dwsYl785N08dP9fRh2s7agLt
	lrOc1bKu2rSfbUuc7Eq/WWAWHAy2TqsvEZedCFyXhNvitAben5vAr7iDHhNuVrMjs8yv
	/lwQ==
X-Gm-Message-State: APjAAAX1vMHWXozUUHymA1cqCf0SZHdoQmRf4GZpNp0CPJBHoUwo0gF1
	KTS2Dm31dt+BPjntZjIHWKk9ah6Qlvjnr8QG
X-Google-Smtp-Source: APXvYqw6tVHcKYgmyIMgSpoqKpBeonCRguvirit1puIrP/r39YPbyGm+mbpPT43xecPZ3JFlYoxU/w==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr22366262wrm.70.1583156405516; 
	Mon, 02 Mar 2020 05:40:05 -0800 (PST)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	a9sm15781707wmm.15.2020.03.02.05.40.04
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Mar 2020 05:40:05 -0800 (PST)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 2 Mar 2020 14:40:03 +0100
Resent-Message-ID: <20200302134003.GC19467@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1643 seconds by postgrey-1.31 at mail19;
	Wed, 26 Feb 2020 15:24:06 CET
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3F77A420005
	for <drbd-dev@lists.linbit.com>; Wed, 26 Feb 2020 15:24:05 +0100 (CET)
Received: by mail-il1-f196.google.com with SMTP id f10so2505726ils.8
	for <drbd-dev@lists.linbit.com>; Wed, 26 Feb 2020 06:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QGW8A6NvrrWP1yUYNzkuM9Y6DPoFVb9Z8KwBG+QV5Lo=;
	b=Vk6w/5mZAyodQkBHzCqY//wn5JgAJqdcOqxWE9FGbVPOxKDaMY3/jEssR4cW31l0kZ
	xnSN3PAOStFfPDzSdOz52NHgqlKbdpw6BQpfgi6JeNU6q+vZzJ9Tkr3nMUTOnPY+/1dR
	SDqZyhx4MtnDSJCwCK4wjBlwI3mj9X5Irm0grREPAE/kYvgtr7NQS4zRSu/B3vUB+wmc
	L4AIsB6ZODPjVNKF22GGbz7urvzlxneuNfVLJ3Fwy1LZq7kBc5la7CvkLe15B77Zp6OV
	Y3oi37jhW7MaO1mVwTS3F7Qk3yPKqwfhnYExvZ33NuK5eMZN/W8k8E6K/iSRrtjJOrOG
	2qpg==
X-Received: by 2002:a5d:9707:: with SMTP id h7mr4749293iol.112.1582725402510; 
	Wed, 26 Feb 2020 05:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20200225234836.GA31741@embeddedor>
In-Reply-To: <20200225234836.GA31741@embeddedor>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 26 Feb 2020 14:56:34 +0100
Message-ID: <CAOi1vP_2+G+0=-a0uqLMYisp+EtHhiVrkWFLFch5JygYVNWvdA@mail.gmail.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Jens Axboe <axboe@kernel.dk>, Sage Weil <sage@redhat.com>,
	linux-ntfs-dev@lists.sourceforge.net,
	"Richard Russon \(FlatCap\)" <ldm@flatcap.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Ceph Development <ceph-devel@vger.kernel.org>,
	Lars Ellenberg <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] [PATCH][next] block: Replace zero-length array with
 flexible-array member
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

On Wed, Feb 26, 2020 at 12:45 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  block/partitions/ldm.h             | 2 +-
>  drivers/block/drbd/drbd_int.h      | 2 +-
>  drivers/block/drbd/drbd_protocol.h | 8 ++++----

For rbd

>  drivers/block/rbd_types.h          | 2 +-

Acked-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
