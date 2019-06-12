Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 8961842856
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 16:03:52 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 6DE981028A7B;
	Wed, 12 Jun 2019 16:03:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 6F5A81028A6D
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2019 16:03:49 +0200 (CEST)
Received: by mail-wm1-f52.google.com with SMTP id c6so6705909wml.0
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2019 07:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nEQ29z9YCKN41j5pkXCEe5ADVDaNWx3NkRJqQPjfG2w=;
	b=qiCiQyB0LD3MXx4v6qB6ADdN615Aj8u/y7f759ghaVntPcuSIdoFFRo7I6tcVAUoYn
	aeAOjpk86lnHa8sCjjPHFCvCqwSLn6QUymwOilHqJZr3pxTyoIK6ni2yNdupq3x9Vyb6
	aZRl1YvOa8F8XIA7ag0e61eNLfMfUp6VtDgoStGv9Ff0uFSFrBRL8RHpt2CmrJw3hh66
	UcRjZ/Sb4iA1yTU9fsKsFOXxAKe8zb/3RAWB+2oqMYepWlAaJXBj9Y9tIoXICY+IBgSE
	dWt9q/Exby5rRusnYWkbk+aRbmkV2LD95nJa06luVIfMOIKX3tcxcXR4vnfjNDiKU+Xq
	BmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nEQ29z9YCKN41j5pkXCEe5ADVDaNWx3NkRJqQPjfG2w=;
	b=FjiwtIgqa6HcMcgAX4naumBwVRKZQ67Non8td0mt11QEgZxYG3br4SzivLhXgUVP6g
	+lXNnltk06k2czeQlcC6ESOpZzr8uM6juNU6W1JWQPG7R1SCe68qLLgRKU7Y0IDu2KrQ
	VpV7sVkWM6Mntf4W7e2YgwwKg4NtyR6ArSJx61obo5Vh8g9QczmO2/nCRqz3S4F4FMig
	iSG9WbdWR6x8zZSf2Rdc0bXJzuww3LuI6zjkkDNspChTOjdy7gxL7IC7rh6HXKdaMYiT
	alw0MUHuIfbAGXghCQQNJQVowdHAJcgdwfCoQgsj2bJuKvgdul4wy0tmzVmrvn/VtrMn
	cgOA==
X-Gm-Message-State: APjAAAXbTmGVjfkeRQJBOYC1L7ZhaOmiSEZULOW86R/6GnT0JRUovKTx
	xaTKVAHyOGCavmrX+uP00yhqlYkFVfw+wg==
X-Google-Smtp-Source: APXvYqybob13PlVyYvuCJoyhJvUxOcL3TJqLih82j+6xyy+GPu2Ejbkz94wVfFtZEjGELXM5XM162w==
X-Received: by 2002:a05:600c:2253:: with SMTP id
	a19mr12150438wmm.156.1560348228364; 
	Wed, 12 Jun 2019 07:03:48 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id 11sm109564wmd.23.2019.06.12.07.03.47
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Jun 2019 07:03:47 -0700 (PDT)
Date: Wed, 12 Jun 2019 16:03:45 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190612140345.GW5803@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <59aa5c8c-7369-e987-4b7c-63490498570e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59aa5c8c-7369-e987-4b7c-63490498570e@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Drbd-dev] schedule_timeout() called without setting task state
 first
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

On Wed, Jun 05, 2019 at 09:59:30AM -0600, David Butterfield wrote:
> The logic in new_or_recycle_send_buffer_page() calls schedule_timeout() without first setting
> the task state.  This will merely yield the processor but not actually wait.  Is that intended?
> 
> In drbd_main.c:
> 968 static void new_or_recycle_send_buffer_page(struct drbd_send_buffer *sbuf)
> 969 {
> 970         while (1) {
> 971                 struct page *page;
> 972                 int count = page_count(sbuf->page);
> 973
> 974                 BUG_ON(count == 0);
> 975                 if (count == 1)
> 976                         goto have_page;
> 977
> 978                 page = alloc_page(GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN);
> 979                 if (page) {
> 980                         put_page(sbuf->page);
> 981                         sbuf->page = page;
> 982                         goto have_page;
> 983                 }
> 984
> 985                 //XXX Don't you need to set something like TASK_*INTERRUPTIBLE first?
> 986                 //XXX I think this just yields the processor but the thread remains runnable(?)
> 987                 schedule_timeout(HZ / 10);

was likely meant to be a schedule_timeout_uninterruptible(), yes.
Frequent typo, unfortunately.

	Lars

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
