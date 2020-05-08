Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD9E1CB69E
	for <lists+drbd-dev@lfdr.de>; Fri,  8 May 2020 20:04:59 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A4B2C4203D3;
	Fri,  8 May 2020 20:04:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A6E4420334
	for <drbd-dev@lists.linbit.com>; Fri,  8 May 2020 20:04:57 +0200 (CEST)
Received: by mail-ed1-f53.google.com with SMTP id l3so1945245edq.13
	for <drbd-dev@lists.linbit.com>; Fri, 08 May 2020 11:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+vtj9kAvnXfdA0IFN6kkpOkjHUwpRBJt7518BSBQldY=;
	b=VLfu18xvdyYvX+V3um74QbEgFlho/gmsdlebCehHgRC64LZ2LrwpLSPmFXlKyiifMG
	/2mXN3cYmzMOG97rtljf0sT2QTUcVKx0FHG3wqHOn7YZJCXdCNGibohHbksMUKyWKlmI
	u1s1YRJzpU1L2la8Jh5ttA2RLPctTxbiNdxv5J+1g/qta/vl3/3fnC/sNfCJYpUd8mBU
	rhA0RJUtnY0TDMxjb+AxGbqdOAZaUfuuGplRawkJdhwtGOz/RRQ8kRykAiOe7EfzaLOX
	DLh537yRKgaNM5aAIB51dRs9O5e+S0jhrluFx3rLNSiCGFuLiqA0Hj3QpKIo8KItLtbA
	P4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+vtj9kAvnXfdA0IFN6kkpOkjHUwpRBJt7518BSBQldY=;
	b=s7PVq0zwyUhp+JR69eb/IXNwJFX+jpRqn3LFdPC/GpLUBnPfYJy2wlAjKyy2/Fdy44
	R8JsTYmckV8g8f+1+tzyb5UCOuTjhHLBI9PpMjl6fhlAraKgzpAfNRj8RMD9tAliImZE
	obpnIq8o2iWRCgW/ZYY5U+tKQlNc0KyvgO9sNLAqzwnjr8JNK3+uQem4KW3f6e7U//w+
	dfk9hhF5qEe5BRTcyQJJqXe1XjTHEFbLtMwgjeOjRaO9OLL9Fum05Qh9pfwti8V4IEC2
	9YVfC3sXBc+BeGIJq7NbFvwL99plTCSYnAeRcWtxJTpicHPmZyT6P1k4G4xGIK5cJt8k
	ncLw==
X-Gm-Message-State: AGi0PuYbI4nQXrzfsbhdA0GBYDjCcmRExKBpJZ8iEtMPlirt2qGjUv7R
	LDXFakOdSVDO79cnWPw4H2aPr4EGSQ0a8WLlNGUQMg==
X-Google-Smtp-Source: APiQypLP4j4lAauikZOSYW9imDv/qSFGiWgh0ghiKFKN6QKIltyJGJv056sHO7WKbYwrvEJrNoRF76BYTsHSimP70IA=
X-Received: by 2002:a50:c3c2:: with SMTP id i2mr3146588edf.93.1588961096815;
	Fri, 08 May 2020 11:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200508161517.252308-1-hch@lst.de>
In-Reply-To: <20200508161517.252308-1-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 8 May 2020 11:04:45 -0700
Message-ID: <CAPcyv4j3gVqrZWCCc2Q-6JizGAQXW0b+R1BcvWCZOvzaukGLQg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
	linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Geoff Levand <geoff@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jim Paris <jim@jtan.com>, linux-block@vger.kernel.org,
	Minchan Kim <minchan@kernel.org>, linux-m68k@lists.linux-m68k.org,
	Philip Kelleher <pjk1939@linux.ibm.com>, linux-bcache@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] remove a few uses of ->queuedata
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

On Fri, May 8, 2020 at 9:16 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> various bio based drivers use queue->queuedata despite already having
> set up disk->private_data, which can be used just as easily.  This
> series cleans them up to only use a single private data pointer.

...but isn't the queue pretty much guaranteed to be cache hot and the
gendisk cache cold? I'm not immediately seeing what else needs the
gendisk in the I/O path. Is there another motivation I'm missing?
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
