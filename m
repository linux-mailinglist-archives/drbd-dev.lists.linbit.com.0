Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 051FD1F824C
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 11:56:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DA3174203FC;
	Sat, 13 Jun 2020 11:56:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 96B054203F3
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:56:19 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id y17so12253432wrn.11
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:resent-from:resent-date:resent-message-id
	:resent-to:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=4o8bmRbgfzERZRr7sLF0I+2xbIArysmLzxBcWgMJVC4=;
	b=IgqJFjKO2v6zySpvMDEW0dpBTuh2dW1C/8iqmgX4rizo5w+oD29L9Pr1o8HeJ8u1B1
	Xz9RGjy/Fc90zqJwI34u+p6akzwS7g2AOuITJuOZOZAPxMfzWaFpenbQUUXdavg62X+g
	jrc106wzxoSfwiItjclY+khc/LDcGmCih1rcNIkBVn/4kKq7KziwQcrLMe7Dvh4WTr88
	U6mE+ht9px5z9DxoRfAGUnf9C3+x05qOnLQbNMQMn2b+UGPhLd1pf/L1fyCygttpbGE4
	EKERuOi0HlXPALW+62H9gFWaFHhXABXjk9Xr32m7QwLtYdlH5Ch05/PxKTxkuEv9R7zW
	ytSg==
X-Gm-Message-State: AOAM530IHBNMjkn32jB8wySqEi176vDPSdQNt++hijIrjuAJZVT3LQxw
	LhcnZFs3aQq1bm/Bu9u2oxeZiP61is+u8Q==
X-Google-Smtp-Source: ABdhPJxk6cuTapq1U5iHk8+7zkJE3C9JAMcy7c7oLt6Bj9t2ehbYyf26ZITwxaCkALbQhtx5Sr/mRA==
X-Received: by 2002:adf:9e03:: with SMTP id u3mr19296413wre.413.1592042178730; 
	Sat, 13 Jun 2020 02:56:18 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	u3sm13104566wmg.38.2020.06.13.02.56.18
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:56:18 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:56:16 +0200
Resent-Message-ID: <20200613095616.GD4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 3488 seconds by postgrey-1.31 at mail19;
	Thu, 23 Apr 2020 12:06:39 CEST
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 04C2A420313
	for <drbd-dev@lists.linbit.com>; Thu, 23 Apr 2020 12:06:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209;
	h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Resent-To:Resent-Message-ID:
	Resent-Date:Resent-From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=4o8bmRbgfzERZRr7sLF0I+2xbIArysmLzxBcWgMJVC4=;
	b=IKukf
	gGh5PFaU/FbNNqQh9waQYHj7xWip9MsS7/zJGm9zBmv4gwgFYSW0S9s3d4+pbHhCoXF8yTJgZ27tu
	aOavqY0b61OPXC9wcgB5Eqov3EUHcxYXEpxdhl0RDu9KELCyGh/MsiX/JjtxHKeiCiPe9q/0Vc2cG
	KpFE7hKoEo8AZLF0t2V+2J9Fg/qIiWz5QYHhGdEctVmSQhwwjqOGydq73unZKBgQBFZU6jo/IjPeS
	5vaQceMNR6KzK6m7c4uFB4y4WWNdS/+lKr91yxRQ935AG+IllGlTrURpWXVjCHR6Tjm3SwIUu9/Is
	OOYdrJ7UCbbCp2hcZzE4hHueL3ZBw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=noisy.programming.kicks-ass.net)
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRXqP-0003IB-Ox; Thu, 23 Apr 2020 09:08:30 +0000
Received: from hirez.programming.kicks-ass.net
	(hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8492D3010C8;
	Thu, 23 Apr 2020 11:08:28 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 67BDC20C02CD2; Thu, 23 Apr 2020 11:08:28 +0200 (CEST)
Resent-From: Peter Zijlstra <peterz@infradead.org>
Resent-Date: Thu, 23 Apr 2020 11:08:28 +0200
Resent-Message-ID: <20200423090828.GV20760@hirez.programming.kicks-ass.net>
Resent-To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com
Date: Thu, 23 Apr 2020 10:57:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20200423085735.GU20713@hirez.programming.kicks-ass.net>
References: <20200422112719.826676174@infradead.org>
	<20200422112831.515522261@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422112831.515522261@infradead.org>
Cc: juri.lelli@redhat.com, axboe@kernel.dk, vincent.guittot@linaro.org,
	rostedt@goodmis.org, dietmar.eggemann@arm.com,
	bsegall@google.com, mgorman@suse.de, tglx@linutronix.de,
	qais.yousef@arm.com
Subject: Re: [Drbd-dev] [PATCH 05/23] sched,
	drbd: Convert to sched_set_fifo*()
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

On Wed, Apr 22, 2020 at 01:27:24PM +0200, Peter Zijlstra wrote:
> Because SCHED_FIFO is a broken scheduler model (see previous patches)
> take away the priority field, the kernel can't possibly make an
> informed decision.
> 
> In this case, use fifo_low, because it only cares about being above
> SCHED_NORMAL. Effectively changes prio from 2 to 1.
> 
> Cc: axboe@kernel.dk
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Ingo Molnar <mingo@kernel.org>
> ---
>  drivers/block/drbd/drbd_receiver.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> --- a/drivers/block/drbd/drbd_receiver.c
> +++ b/drivers/block/drbd/drbd_receiver.c
> @@ -6020,9 +6020,8 @@ int drbd_ack_receiver(struct drbd_thread
>  	unsigned int header_size = drbd_header_size(connection);
>  	int expect   = header_size;
>  	bool ping_timeout_active = false;
> -	struct sched_param param = { .sched_priority = 2 };
>  
> -	rv = sched_setscheduler(current, SCHED_RR, &param);
> +	rv = sched_set_fifo_low(current);

As noted by Dietmar, I forgot to mention loosing RR in the changelog,
bad me.

In this case I'm not actually 100% sure, but there was no comment with
it that justified it being RR, and RR-SMP is not optimal (in fact it's
rather buggered).

In general RR is even more 'interesting' to get right thatn FIFO and
therefore I figured it probably didn't want to be RR, but given there
can be multiple of such threads, it might have been an attempt at
providing some sort of fairness between the multiple threads.

At the same time, if you're running the threads so hard that RR makes a
difference, it's unlikely there is any actual NORMAL time left and
things will be unhappy anyway.

Therefore, and me being lazy, make it FIFO.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
