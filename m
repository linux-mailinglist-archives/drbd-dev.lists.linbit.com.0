Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB86789405
	for <lists+drbd-dev@lfdr.de>; Sat, 26 Aug 2023 08:28:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7792442683E;
	Sat, 26 Aug 2023 08:28:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 461 seconds by postgrey-1.31 at mail19;
	Fri, 25 Aug 2023 13:55:31 CEST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 32957426838
	for <drbd-dev@lists.linbit.com>;
	Fri, 25 Aug 2023 13:55:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D46367AA1;
	Fri, 25 Aug 2023 11:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2880DC433C7;
	Fri, 25 Aug 2023 11:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692964068;
	bh=Q12a5jCz9Y05UL3JyEMUoFRHg2W/veTXXFw53T4To0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OdqC2q3MBCTgc/LCSWxDLqKCnlnMJwSZMWopIfxVw8QRhexqNvrhMokF9/aF2T2sV
	aLvff3AaOYfUQ2kixfYl4Q+xFzOHQWqsN6mhEVAhDBUJ3AB2zNdylPFJw81co46/eJ
	ubCZvGOHTyj7yBsG4woSipWDT9fVuOhKhO2sgW97DPSe4zlTMloFO06S70bffktE6q
	TresDfl9aKiRAB+i0ODQxH6D4Hua4Y108CE4XUjEi6T3MQXSGCSxeRVQEOPricPCKR
	Okyu9WQUeuV72ZWK7NFp6rGTXiCNBjMxbze9gBrkF480B6nD/PCKIPsAamy87RgDTr
	oWLvv+23o6COA==
Date: Fri, 25 Aug 2023 13:47:39 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20230825-neubeginn-kannst-cdb8a45263f7@brauner>
References: <20230818123232.2269-1-jack@suse.cz>
	<20230823104857.11437-4-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230823104857.11437-4-jack@suse.cz>
X-Mailman-Approved-At: Sat, 26 Aug 2023 08:28:33 +0200
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 04/29] drdb: Convert to use
	bdev_open_by_path()
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

On Wed, Aug 23, 2023 at 12:48:15PM +0200, Jan Kara wrote:
> Convert drdb to use bdev_open_by_path().
> 
> CC: drbd-dev@lists.linbit.com
> Acked-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---

Looks good to me,
Acked-by: Christian Brauner <brauner@kernel.org>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
