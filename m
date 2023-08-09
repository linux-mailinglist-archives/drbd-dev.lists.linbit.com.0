Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DDA776B15
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Aug 2023 23:40:11 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 99397420B00;
	Wed,  9 Aug 2023 23:40:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 2403 seconds by postgrey-1.31 at mail19;
	Wed, 09 Aug 2023 23:40:09 CEST
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4FF9742066F
	for <drbd-dev@lists.linbit.com>; Wed,  9 Aug 2023 23:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID;
	bh=SuYKXbiQSoXZEz5mfCg5gD/UnTQOyRLetjmCNaPirb0=; 
	t=1691617209; x=1692826809;
	b=IfTIaGSgdZGkOQ2jLYEJvjMSC9HDGLS/T6bLDD1C7q+cvuc
	xgHFnCcVuHFoXW+KOmogifdttoo0ZsS2nKAkfWI8N/nV6rW1g4hBtE/grZflEeFsWBK3/qiaMSYHS
	sMcwgu0qwZuuZztYJzUxG6lQ543GkPAIqOrAlKIU6KpMARYpVsGLlf+TgwAUAP3TeFIgBNvsSlsje
	KLcDJQH4N6ry5dm/MD4vTvuU45tv4GDYEzw+QTie/dXHQInXfU5zeDpte93lkZT3xC+HsdwDOdUtg
	N+wvbwnUyASCa3V/nOBUCIlnlx0G8TDDl4iOArcnVzrfi0R6nY+Rusvfq/Ys2TZg==;
Received: by sipsolutions.net with esmtpsa
	(TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
	id 1qTqHU-00F7uX-2j; Wed, 09 Aug 2023 22:59:49 +0200
Message-ID: <6f4b7e118ac60394db7e5f8e062e8ddeb4370323.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Date: Wed, 09 Aug 2023 22:59:47 +0200
In-Reply-To: <20230809182648.1816537-4-kuba@kernel.org>
References: <20230809182648.1816537-1-kuba@kernel.org>
	<20230809182648.1816537-4-kuba@kernel.org>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, jiri@resnulli.us,
	netdev@vger.kernel.org, philipp.reisner@linbit.com,
	pshelar@ovn.org, jmaloy@redhat.com, edumazet@google.com,
	tipc-discussion@lists.sourceforge.net, ying.xue@windriver.com,
	dev@openvswitch.org, lars.ellenberg@linbit.com,
	pabeni@redhat.com, drbd-dev@lists.linbit.com, jacob.e.keller@intel.com
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

On Wed, 2023-08-09 at 11:26 -0700, Jakub Kicinski wrote:
> Only three families use info->userhdr and fixed headers
> are discouraged for new families. So remove the pointer
> from struct genl_info to save some space. Compute
> the header pointer at runtime. Saved space will be used
> for a family pointer in later patches.

Seems fine to me, but I'm not sure I buy the rationale that it's for
saving space - it's a single pointer on the stack? I'd probably argue
the computation being pointless for basically everyone except for a
handful users?

Reviewed-by: Johannes Berg <johannes@sipsolutions.net>

johannes
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
