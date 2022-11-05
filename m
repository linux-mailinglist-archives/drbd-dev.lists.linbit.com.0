Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 551E661DDB3
	for <lists+drbd-dev@lfdr.de>; Sat,  5 Nov 2022 20:31:35 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2C8842177E;
	Sat,  5 Nov 2022 20:31:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 929C84201E3
	for <drbd-dev@lists.linbit.com>; Sat,  5 Nov 2022 20:31:33 +0100 (CET)
Received: by mail-oi1-f175.google.com with SMTP id b124so8447340oia.4
	for <drbd-dev@lists.linbit.com>; Sat, 05 Nov 2022 12:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
	:reply-to; bh=CTlAHc9k7qwIZyOhFoXagieaQq5pwRyAvyi0mAOE5RE=;
	b=jURw19XL/xOvCrYwmv2aWUKdeAoWjP9YO+FTg9LO7kNLGP2qrxnNI/DeaM/hhYlqsP
	YdQYptnzjKsYbbyAKOY5T5QWBhSSLuRj9tx/h3x3Iolz6OENad9xOgpnNTl3bQfF4abr
	IGnRZ+gwoVhjhy8eDyzb76gdYWeTNG8HbYJzf+upnNf3q7GfCqhXHTbMnctQM+lT4ISN
	LgN+zILvYp/x3cxyWSBN67VcIOLSthpIiMe3XVQLxJ5DNQbV3DpA0r2y4Xi6Om/6kI/T
	+bTGJHJtUOpMMkvOkxDlr0Z5JMnZYu43sVpFgzYDCR/HFlqDOFJ8Z5bQFtUlln66Rbqg
	ggdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=CTlAHc9k7qwIZyOhFoXagieaQq5pwRyAvyi0mAOE5RE=;
	b=A+SVBWlaEx0DmohwiHpCWL5KQv1q9x/7xiXg3GZM63j1pvBMvJBR9HswOk8aerFr1G
	BcLYyX6o4KbfNnSRNgayYGLn6JobjAAde/73t9gRinXiK77fjbBSKPMDDOp7GaJBVVLT
	TEvVOu/p/Cm1FDAnGRoCZQjjFqFsbIca3sCrYfWDFNKZ2WzG4PeqUDutYZhTroIrbti3
	xET3aQ4jkXmlQCMgjOU94opcCjsqLWIRZ3dTworh+C7jeI5JoV/DCV2VUS7VQNzz5yiv
	vuEDeLumqeyR9u44kAs9iQDQ/+8iiPxtspgzo9nxPkdVj6BnMpt0zDIjBpwtRIk3dg/I
	DEaw==
X-Gm-Message-State: ACrzQf2nl1lJgxmEjPVHHWHNEHYFVynO77UaLQwQ/5ecTJEpU9eG9CPN
	Ta75xGP8G3Jfgr7AMQy1qps=
X-Google-Smtp-Source: AMsMyM7VRYR4ja1354r4nOb4sGsFC9SF+e+FSsFCXSIKNyBk3irIl03bXoaveyKZeBBPlTvKUXlEMQ==
X-Received: by 2002:a05:6808:1708:b0:351:728b:3a03 with SMTP id
	bc8-20020a056808170800b00351728b3a03mr22106906oib.275.1667676692450;
	Sat, 05 Nov 2022 12:31:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	l14-20020a4ac60e000000b00499499a8e18sm834040ooq.5.2022.11.05.12.31.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 05 Nov 2022 12:31:31 -0700 (PDT)
Date: Sat, 5 Nov 2022 12:31:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20221105193129.GA1487775@roeck-us.net>
References: <20221105060024.598488967@goodmis.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221105060024.598488967@goodmis.org>
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-leds@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
	linux-afs@lists.infradead.org, lvs-devel@vger.kernel.org,
	linux-acpi@vger.kernel.org, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
	bridge@lists.linux-foundation.org, linux-pm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, rcu@vger.kernel.org,
	cgroups@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
	Anna-Maria Gleixner <anna-maria@linutronix.de>,
	linux-edac@vger.kernel.org, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-parisc@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	netfilter-devel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Drbd-dev] [PATCH v4a 00/38] timers: Use timer_shutdown*()
 before freeing timers
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

On Sat, Nov 05, 2022 at 02:00:24AM -0400, Steven Rostedt wrote:
> 
> Back in April, I posted an RFC patch set to help mitigate a common issue
> where a timer gets armed just before it is freed, and when the timer
> goes off, it crashes in the timer code without any evidence of who the
> culprit was. I got side tracked and never finished up on that patch set.
> Since this type of crash is still our #1 crash we are seeing in the field,
> it has become a priority again to finish it.
> 
> The last version of that patch set is here:
> 
>   https://lore.kernel.org/all/20221104054053.431922658@goodmis.org/
> 
> I'm calling this version 4a as it only has obvious changes were the timer that
> is being shutdown is in the same function where it will be freed or released,
> as this series should be "safe" for adding. I'll be calling the other patches
> 4b for the next merge window.
> 

For the series, as far as my testbed goes:

Build results:
	total: 152 pass: 152 fail: 0
Qemu test results:
	total: 500 pass: 500 fail: 0

No runtime crashes or warnings observed.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
