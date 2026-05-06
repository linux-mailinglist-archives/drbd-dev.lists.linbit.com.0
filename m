Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEAFMtw3+2nUXwMAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 06 May 2026 14:45:16 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 822EB4DA6BD
	for <lists+drbd-dev@lfdr.de>; Wed, 06 May 2026 14:45:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2768164D99;
	Wed,  6 May 2026 14:45:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DFF081622C5
	for <drbd-dev@lists.linbit.com>; Wed,  6 May 2026 14:45:00 +0200 (CEST)
Received: by mail-wm1-f43.google.com with SMTP id
	5b1f17b1804b1-4890d945eb4so5607455e9.0
	for <drbd-dev@lists.linbit.com>; Wed, 06 May 2026 05:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1778071500;
	x=1778676300; darn=lists.linbit.com; 
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:mail-followup-to:message-id:subject:cc:to
	:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=9+rkUegOrkmyy32FLh2DFlaV0PClzR+z6g1B8CVkeKo=;
	b=kCpxC5TKI3xG7fm3Au9S0UxcNbALvnN8cSvNCbfUw4n50yXmxrOUSjc3XYW2zJySmQ
	sjby/JGRlFmcgtSUJP8eMfogSRzqzLNzXZx7u8hDuCXfqr5sZUEaywJJGnkGbURdNNCt
	2IliXWh/0FEyoKsL0ZmwEsS0J1LNOkks4Tg6VFwEsU9dmqr+lOeELlXKCJ5tTM/aU7I6
	uP/VHo/+4l5a/a3gGwaB9VlbOYaqlh8yBZSpzK5klUxQKjdtQy/I02YriAYXnzJgfr2/
	Pbd/tzGgXjqizC05eEnXr9pPY9WQnwRgrazazmpbbISXt9HP8gDBOhTTeIOXM5jgOUgL
	KUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1778071500; x=1778676300;
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:mail-followup-to:message-id:subject:cc:to
	:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=9+rkUegOrkmyy32FLh2DFlaV0PClzR+z6g1B8CVkeKo=;
	b=KSj5twC+SKIudjstjQYvbvh84c+K7vaQ06lenrri339uchp0RUwe0F3NedmRyiv5Zc
	vV7+Ll1lk6ADx5KRG1OXvrE3tSHIymB6xWgiAkIGja/r9PnLFi7aTiqeRGNhhBhFBfdW
	0nWpYRvJ+R1u0Bdbn25yVUBRmJhI+bXYk5j/8BaukB2KTcHutE3OWZMGvlUPqpYsgsgy
	HdwbQrBr3YCqQ1ZWtsnmLblWXv7ctoUubZU0VQxuvHJQ1B9YYybD//9Oatg75cRhELMU
	rWfdLSsJZgW9j/8rQcdJ39N9l7FL3+C52Sh0hN+s4HVdVRqlGvNiixqFJt7MYk7GhM3A
	Z8PQ==
X-Gm-Message-State: AOJu0YwCa8NzOzLMnP5+fd/0OhFRL75f82McJn/qkYEKK5NtG/Lpcm1g
	st77pL+ErHBSs8KadQVsJG9oCP00FXLQyyCUR5aMXUmNHNpAU2B7LZjrzSKk3gXvc4G0nw==
X-Gm-Gg: AeBDiesjP5hhh/QQqxorlnQJqEhWTbALgB5cuKxBDQKtV3Vl+EEJcUNzpgzcn31gK0f
	BeI1a+RWNAtSpqmnm9w47IlPzvlXVxtsryMLyYPVtUDFWu4VT60Sonh+/zk6OqF4JovzBhZYTxJ
	1jgTEuRb7YiarhjVRbW7mIUD2wifGqscOc7NNBl7g2AKdzO6N3AzW7T5+9qH5BKW60JrSq63tP2
	5U69PNse3Fjc85BWQxP7a2gZwen/HJHuwaW4yTLw/DWxgcGzVzegWFOdec4bAT8M+cbbCBC2oct
	Vf0tVzTOj54H5D1xO9wWTokJvboSxmB9ezQv6N+ddQ/xfb4vcfXr6iAcUKuxv9glZTIkcdzFU3g
	4ElRinrafCSs/xQV6fPuVCu6A/SxojPamSza9FqRhhC97F78Xl0qlluyAwIrB/XiijM+Pr1qeDO
	VeElMTzMhnlKldHzSLGoyCbdG33qdTcJpGl2p/GfwC6KkJMA6vkwKpApCM4U1AIORdN+JVaUA6Y
	+fXl3zu33Mk6UqE
X-Received: by 2002:a05:600c:6612:b0:486:f893:56c6 with SMTP id
	5b1f17b1804b1-48e522b71f2mr47915505e9.10.1778071500107; 
	Wed, 06 May 2026 05:45:00 -0700 (PDT)
Received: from localhost (h082218028181.host.wavenet.at. [82.218.28.181])
	by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-48e53108c4csm23047995e9.6.2026.05.06.05.44.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 May 2026 05:44:58 -0700 (PDT)
Date: Wed, 6 May 2026 14:44:58 +0200
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v2 0/2] drbd: switch from genl_magic to YNL
Message-ID: <afs3cyhtAbsr6T1D@localhost.localdomain>
Mail-Followup-To: Jens Axboe <axboe@kernel.dk>, drbd-dev@lists.linbit.com, 
	linux-kernel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, 
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
References: <20260506123926.1944290-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506123926.1944290-1-christoph.boehmwalder@linbit.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, netdev@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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
X-Rspamd-Queue-Id: 822EB4DA6BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linbit.com,google.com,kernel.org,lists.linbit.com];
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:donald.hunter@gmail.com,m:netdev@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:edumazet@google.com,m:kuba@kernel.org,m:lars.ellenberg@linbit.com,m:donaldhunter@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20251104.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.360];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns,localhost.localdomain:mid]

On Wed, May 06, 2026 at 02:39:24PM +0200, Christoph Böhmwalder wrote:
>DRBD's genetlink interface was defined using a custom multi-include
>macro system, genl_magic_{func,struct}.h. This system generated struct
>definitions, netlink policies, serialization functions and more
>from a single "magic" header.
>It never really caught on; DRBD is its only user, its internal macro
>jungle is next to impossible to understand, and even harder to debug.
>
>This series replaces it with the standard solution, YNL.
>The *_gen.[ch] files were created with a modified YNL generator, but
>these modifications are not shipped because the current DRBD family is
>effectively frozen.
>
>Note: this family primarily aims for compatibility with existing
>userspace. The next planned step is a new (also YNL-based) family,
>"drbd2", which will implement all the actual modern recommendations for
>new netlink families.
>
>Changes from v1:
>- Remove YNL generator patches, ship just the generated code

Sorry everyone, this series was based on an old commit and does not
compile. Please disregard and look at v3 instead.
