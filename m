Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB7241ABF2
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Sep 2021 11:32:38 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 19CE44207D4;
	Tue, 28 Sep 2021 11:32:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87DBD42095C
	for <drbd-dev@lists.linbit.com>; Tue, 28 Sep 2021 00:50:48 +0200 (CEST)
Received: by mail-ed1-f52.google.com with SMTP id v10so71018197edj.10
	for <drbd-dev@lists.linbit.com>; Mon, 27 Sep 2021 15:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lbtHxjRemmXiBIhG0GW8nlURXNpwyPs370Xxo7AeQQk=;
	b=YZ2VTmSCUUUwt9GaX+TF009NFPIKAVOBMPTgS3jayY1GsTxjk0eyD6zyo3KSDp2ffd
	15/G6kf8ngNImvfP+WO3GwmQFWGvbVqsojWS5PsZGnhvbMFfwNf8hSswllXfjJWH5bOE
	iuZL52rFsekbaWI4lIXdwtbN7zFzDlTDgpjQpSXSpN15NE9HDPayoVqneLYjbtMi9s4X
	ps/Z9ps2NUVxdYW6SyynTklGHbpuzsS5CawTlfWbAl6o8ozZlHhvGY0lDmYlvpfHfCUs
	GD4OE0hwIQQOcnCDaiwMPQ95SiG9tHFH0M56s31hXESkpNn5z5fJT/O3fmOeyg3xh3Pb
	IunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lbtHxjRemmXiBIhG0GW8nlURXNpwyPs370Xxo7AeQQk=;
	b=IOWE0z65eL9kLf5EW6rpIUzPxPxizAvKeYvt6hAapikM9zwcTk1C8r0X6Qh+isScL3
	SAuJFZXByA5IfHEkhI0nMaOP3tQextzdGXz3oeSYWIXpKQHBIhf3BI/vDc5kEANjtcnA
	lNAJKy1cUkYNFSPXnwotm1NrrJ2vZ1teBBiRdAg1iwpYeJvaEhJrPYUGUOumPkwjRUnp
	Cz7zbmFMWH/MYM9v8gfdoP4+Tzv3cogta85YluSXqflSVnRa2YAa5XBk8IXVkFa7y5Xb
	klMIXzb1vpwXX5tbw1FJKrwXHrYjxXvVD+jEiDE5X0KDWXvc+em6FeQBpcdQeJ+DJTW/
	3QCw==
X-Gm-Message-State: AOAM531ZcR/hpWvYI8JpsLQUNM3rLE0+qKwLhuZkzWBIukc9/QT2Uyfl
	r9N9+BbXcd9CPaaO48gG8YT1ybRSyyB1ed0PVrk=
X-Google-Smtp-Source: ABdhPJxqWtQBQk+q3MXvQ7lymGiQEolFkglJxXrWFsK3GxDKn2WvP9KOWmJHtaEmST6By7Czy4V78fbFN5iEYd3RzYA=
X-Received: by 2002:aa7:d592:: with SMTP id r18mr3465274edq.172.1632783048036; 
	Mon, 27 Sep 2021 15:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210927220110.1066271-1-mcgrof@kernel.org>
	<20210927220110.1066271-7-mcgrof@kernel.org>
In-Reply-To: <20210927220110.1066271-7-mcgrof@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Sep 2021 15:50:36 -0700
Message-ID: <CAMo8BfLX84HBuVe=FyqWkVU5Ek-aKFk++omnqsmf9wO6fdVpMQ@mail.gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mailman-Approved-At: Tue, 28 Sep 2021 11:32:35 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, justin@coraid.com,
	LKML <linux-kernel@vger.kernel.org>, krisman@collabora.com,
	tim@cyberelk.net, drbd-dev@lists.linbit.com,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	"open list:TENSILICA XTENSA PORT \(xtensa\)"
	<linux-xtensa@linux-xtensa.org>, johannes.berg@intel.com,
	Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	"open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
	hare@suse.de, Jens Axboe <axboe@kernel.dk>,
	Chris Zankel <chris@zankel.net>, philipp.reisner@linbit.com,
	chris.obbard@collabora.com, Tejun Heo <tj@kernel.org>,
	lars.ellenberg@linbit.com, thehajime@gmail.com, zhuyifei1999@gmail.com
Subject: Re: [Drbd-dev] [PATCH v2 06/15] xtensa/platforms/iss/simdisk: add
 error handling support for add_disk()
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

On Mon, Sep 27, 2021 at 3:01 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  arch/xtensa/platforms/iss/simdisk.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
