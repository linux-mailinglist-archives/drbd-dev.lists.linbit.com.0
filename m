Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C37BB298DB
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Aug 2025 07:22:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ED09B162706;
	Mon, 18 Aug 2025 07:22:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 557 seconds by postgrey-1.31 at mail19;
	Wed, 13 Aug 2025 11:49:59 CEST
Received: from smtp1.iitb.ac.in (smtpd7.iitb.ac.in [103.21.126.62])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A32C16225B
	for <drbd-dev@lists.linbit.com>; Wed, 13 Aug 2025 11:49:59 +0200 (CEST)
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 4441F101A45B
	for <drbd-dev@lists.linbit.com>; Wed, 13 Aug 2025 15:10:40 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 4441F101A45B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1755078040; bh=r+ogwS6zQjeSBn776QngYtEOAsPLDZQTut3nCmVuv68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IyetmWSNH5XjFey2IDSYKVEigxqx3gDpa5bLTgukMmsNTuq/baR797OGe64wgJvnh
	86PusgIi7sM06AAnsdRRKyr/U6ucVcXi9rzCpArAXE9GlkEKGjBrG6MvvMQmQXfPH/
	yIPX9lEaowlan08qPAikjA8vxKeYQydRq4fJlUJg=
Received: (qmail 14228 invoked by uid 510); 13 Aug 2025 15:10:40 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from
	<akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
	spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
	Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.40343 secs;
	13 Aug 2025 15:10:40 +0530
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on ldns2.iitb.ac.in
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=IITB_ORIG,PROPER_IITB_MSGID
	autolearn=disabled version=3.4.1
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
	by ldns2.iitb.ac.in with SMTP; 13 Aug 2025 15:10:36 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 0093E3414ED;
	Wed, 13 Aug 2025 15:10:36 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 49F7F1E8132B;
	Wed, 13 Aug 2025 15:10:35 +0530 (IST)
Date: Wed, 13 Aug 2025 15:10:30 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: Erick Karanja <karanja99erick@gmail.com>
Subject: Re: [PATCH] Docs: admin-guide: Correct spelling mistake
Message-ID: <aJxdjoALgYkPJ61Y@bhairav-test.ee.iitb.ac.in>
References: <20250813071837.668613-1-karanja99erick@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813071837.668613-1-karanja99erick@gmail.com>
X-Mailman-Approved-At: Mon, 18 Aug 2025 07:21:50 +0200
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>, skhan@linuxfoundation.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Wed, Aug 13, 2025 at 10:18:36AM +0300, Erick Karanja wrote:
> Fix spelling mistake directoy to directory
 Fix spelling mistake directoy --> directory

> 
> Reported-by: codespell
> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  Documentation/admin-guide/blockdev/zoned_loop.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/blockdev/zoned_loop.rst b/Documentation/admin-guide/blockdev/zoned_loop.rst
> index 9c7aa3b482f3..64dcfde7450a 100644
> --- a/Documentation/admin-guide/blockdev/zoned_loop.rst
> +++ b/Documentation/admin-guide/blockdev/zoned_loop.rst
> @@ -79,7 +79,7 @@ zone_capacity_mb   Device zone capacity (must always be equal to or lower than
>                     the zone size. Default: zone size.
>  conv_zones         Total number of conventioanl zones starting from sector 0.
>                     Default: 8.
> -base_dir           Path to the base directoy where to create the directory
> +base_dir           Path to the base directory where to create the directory
>                     containing the zone files of the device.
>                     Default=/var/local/zloop.
>                     The device directory containing the zone files is always
> -- 
> 2.43.0
> 
> 
