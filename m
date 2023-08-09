Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1547A776BA5
	for <lists+drbd-dev@lfdr.de>; Thu, 10 Aug 2023 00:02:52 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7ABEA4252A4;
	Thu, 10 Aug 2023 00:02:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2B2BC420171
	for <drbd-dev@lists.linbit.com>;
	Thu, 10 Aug 2023 00:02:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33F2964AF1;
	Wed,  9 Aug 2023 22:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71134C433C7;
	Wed,  9 Aug 2023 22:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691618568;
	bh=0JZWBZyc7Y9wfXoloSzdrw2QgX5w5zayWt9GtZxJQ9U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m2k/MCrmXLrlwGOwtMvOufID5yN80HZ7vUG6CqnNVeojN/TVxLbQVQzcupTh2+vY3
	qXw1HAty12qGgegGw3NLPlJ/o3JslNfLQs7YLK3+xvY+9vDJZLgIpr+4Utc4Xjqgai
	HDilGbnyRQgHykrv9hXwvqxTZZfWLl4rX5AxoHWSqHG+IZe8ZJZLVkeOQBX82cHgLM
	XeMjem/8yGTISRI8vcj0UCgIadWdXcnPO2t+9ugsG63Cfe7DgblxCrd7tbLkcn+K3p
	RK4HeGMfCRBYUZ9IyVqOtjcKewXNu/jItz1zKjpFlKFR0a/VmKodot5HXjSM7/IOIR
	YqBa836GN00gQ==
Date: Wed, 9 Aug 2023 15:02:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Message-ID: <20230809150246.4d1c0be6@kernel.org>
In-Reply-To: <6f4b7e118ac60394db7e5f8e062e8ddeb4370323.camel@sipsolutions.net>
References: <20230809182648.1816537-1-kuba@kernel.org>
	<20230809182648.1816537-4-kuba@kernel.org>
	<6f4b7e118ac60394db7e5f8e062e8ddeb4370323.camel@sipsolutions.net>
MIME-Version: 1.0
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, jiri@resnulli.us,
	netdev@vger.kernel.org, philipp.reisner@linbit.com,
	pshelar@ovn.org, jmaloy@redhat.com, edumazet@google.com,
	tipc-discussion@lists.sourceforge.net, ying.xue@windriver.com,
	dev@openvswitch.org, lars.ellenberg@linbit.com,
	pabeni@redhat.com, drbd-dev@lists.linbit.com,
	davem@davemloft.net, jacob.e.keller@intel.com
Subject: Re: [Drbd-dev] [PATCH net-next 03/10] genetlink: remove userhdr
 from struct genl_info
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

On Wed, 09 Aug 2023 22:59:47 +0200 Johannes Berg wrote:
> On Wed, 2023-08-09 at 11:26 -0700, Jakub Kicinski wrote:
> > Only three families use info->userhdr and fixed headers
> > are discouraged for new families. So remove the pointer
> > from struct genl_info to save some space. Compute
> > the header pointer at runtime. Saved space will be used
> > for a family pointer in later patches.  
> 
> Seems fine to me, but I'm not sure I buy the rationale that it's for
> saving space - it's a single pointer on the stack? I'd probably argue
> the computation being pointless for basically everyone except for a
> handful users?

Fair, I'll update all the commit messages.

> Reviewed-by: Johannes Berg <johannes@sipsolutions.net>

Thanks!
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
