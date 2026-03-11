Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCo8APSesWnkDAAAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 11 Mar 2026 17:57:24 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 92D2D2679C9
	for <lists+drbd-dev@lfdr.de>; Wed, 11 Mar 2026 17:57:23 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F24A71630F1;
	Wed, 11 Mar 2026 17:57:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 431 seconds by postgrey-1.31 at mail19;
	Wed, 11 Mar 2026 17:57:07 CET
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 13050160876
	for <drbd-dev@lists.linbit.com>; Wed, 11 Mar 2026 17:57:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fWGv66CKlzlfl7L;
	Wed, 11 Mar 2026 16:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	s=mr01; t=1773247791; x=1775839792; bh=ccZtHWXsBCpJCuDGYX4TbiD6
	sbKX4f7/OBYKG3a4jCk=; b=EwwCwKUmthCu5i4rlJ2yBqVhufvgIL8l76tQKQ7x
	XfPfyJDsPzAG2uTB0Fu+yTCWFfhKGQtGHZ8qhQXSk6W88V8kGq0GptHuhBFmJJOr
	n3NwW9XWjLiqfqbS1kUAU/Dwv7YKZoCDTVgfltjHwYZlXnPGM7FCXMJmPEFtGrnc
	zW29LiSO3Dkb1d0z5SAMtndqqSibr3GOBVnvBnPOlEzMhG8EhjCzWVq3ckQPN8ML
	xAwJHzBWDhUWuw5GleugHqikXHf6dRF0Em8LByeFgz6Xb8Ivs29px6T127+Jx4Ti
	Xb0cHcz0qdZM4SUrLTnPj7glh6+L5ouoKTy7Pw23BYAvBg==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
	by localhost (013.lax [127.0.0.1]) (mroute_mailscanner,
	port 10029) with LMTP
	id x1wlsCwcGjhM; Wed, 11 Mar 2026 16:49:51 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fWGv20Jrlzlfl5x;
	Wed, 11 Mar 2026 16:49:49 +0000 (UTC)
Message-ID: <445d61ae-c579-4558-a127-62291473ac6f@acm.org>
Date: Wed, 11 Mar 2026 09:49:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drbd: fix pointer cast spacing
To: Richard Lyu <richard.lyu@suse.com>,
	Philipp Reisner <philipp.reisner@linbit.com>
References: <20260311083510.183631-1-richard.lyu@suse.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260311083510.183631-1-richard.lyu@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[acm.org:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:richard.lyu@suse.com,m:philipp.reisner@linbit.com,m:axboe@kernel.dk,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bvanassche@acm.org,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,drbd-dev-bounces@lists.linbit.com];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,acm.org:dkim,acm.org:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 92D2D2679C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 1:35 AM, Richard Lyu wrote:
> Checkpatch.pl reports the following coding style issue:
> ERROR: "(foo*)" should be "(foo *)"
> +		struct p_trim *t = (struct p_trim*)p;
Checkpatch is for checking patches before these are posted on a Linux
kernel mailing list and should not be used on code that has already
been merged into the Linux kernel tree.

Thanks,

Bart.
