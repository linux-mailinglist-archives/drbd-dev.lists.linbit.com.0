Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2444287A
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 16:11:55 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 231241028A76;
	Wed, 12 Jun 2019 16:11:54 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id B5D331028A6D
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2019 16:11:52 +0200 (CEST)
Received: by mail-wr1-f53.google.com with SMTP id e16so17123801wrn.1
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2019 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CXYR0Di/sFTezDliLA3AQZ2JLuhopJVOPQSbBJnC4LI=;
	b=H1yOl2PLKdKI3XxxlLGH+TpKD0SEBahMnAEVRcZvi5nxpdRZLBDquW1RvTJ0z/En3/
	HjjHbYatyKlY6vElM1YGU6IPXfq6qfBZRG/f2JZnxbnK5Sm/p0Cbjt0VGx5saTbDV0dm
	6jhiQMEcGTokmGluqiAI1esitMQANUAR+tJ70Q9gRbyOg46KXBOS9Rc6syH1RtSAym/0
	8OkxoXs5F1IisMl+g6o/tE4Pb06BzDkn3NaPQTe19pSnYqtyFiKfRa+cFudRK+7l98qo
	uaByTPzXQyPZ9oYds/zAEQTF16MyXPM1s4ZJXQcv9Vye6f5qVO4Md6Q9sQC8LtLWM5ZU
	KQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CXYR0Di/sFTezDliLA3AQZ2JLuhopJVOPQSbBJnC4LI=;
	b=cIsUsmmnCp2ymIbm3Mj90LZs39XlrZLab6/fmQPMwsrggfLwiupbX2z1PlpStcmDpO
	5snYoigFjgJQbXM/vkPqQP7yX4eBZ655Fp0FonwxO17OtwIZo8HTh6QuTd+Srx1MzWS6
	GGHh/FshMSs83e1BFFWEi6HrZYCY3UQNrOtWTKi6XNAHO4dNjAhZUxrRNn58q2fpgft+
	iqXMSith7SE92b0rseSjpo7HdHkzTEP7Wm26IaVYXeRjqvXoWedmgZdnSZf26Fn9Ri1M
	uyCQeW/Mb2S3URTHzXZWkgTEAtqpw/lEj7XdSIimKCd6cEgjQef+q6LchnNDWCZFKq38
	IO2A==
X-Gm-Message-State: APjAAAXskpp0A64rE/q7bEZeK4RV1WCHiro7UkMrVlCdaOeYxIkEyKfm
	lCbmzYrYdwLULbpwFMsTIsAjUmluqGh9SA==
X-Google-Smtp-Source: APXvYqx7zlUd5jqX2lyDAjJ8WnppE2edq0FxZsXc0vxA49BCmn5xfKW7O5cTBtFFoivTLAmmRUSOGg==
X-Received: by 2002:adf:e9c4:: with SMTP id l4mr7458288wrn.142.1560348711842; 
	Wed, 12 Jun 2019 07:11:51 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id k82sm149312wma.15.2019.06.12.07.11.50
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Jun 2019 07:11:51 -0700 (PDT)
Date: Wed, 12 Jun 2019 16:11:49 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190612141149.GA5803@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <e9d5ec6e-30e9-9af1-06c3-bcf8b1d92068@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9d5ec6e-30e9-9af1-06c3-bcf8b1d92068@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Drbd-dev] avoid use of errno as a function parameter name
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Wed, Jun 05, 2019 at 10:14:19AM -0600, David Butterfield wrote:
> Avoid use of errno as an argument name because it is allowed to be a macro such as
>     # define errno (*__errno_location ())

You do realize that we are kernel code...

   Lars
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
